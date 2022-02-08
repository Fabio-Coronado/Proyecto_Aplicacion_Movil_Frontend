import 'dart:async';
import 'package:application/models/categorie.dart';
import 'package:application/models/levels.dart';
import 'package:application/models/user.dart';
import 'package:application/question/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatefulWidget {
  final User user;
  final Level level;
  final Categorie categoria;
  //final Function press;
  const ItemCard({
    Key key,
    this.user,
    this.categoria,
    this.level,
    //this.press
  }
  ):super(key : key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> { 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 400,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image:  AssetImage(widget.level.image),
                fit: BoxFit.fill,
              ),
            ),
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              onPressed: press,             
              borderSide: BorderSide(
                width: 4.0, 
                color: Colors.grey
              ),
              splashColor: Colors.green,
              highlightedBorderColor: Colors.green,
              child: Stack(
                children:<Widget>[
                  Text(widget.level.title,
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    //color: Color(0xff05ff00),
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Colors.black,
                    
                    ),
                  ),
                  Text(widget.level.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff19d125),
                    fontSize: 40,            
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
      );
  }


  void press(){
        
        print(widget.user.firstname);
        print(widget.user.lastname);   
        print(widget.categoria.title);                
        print(widget.level.title);
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => 
          QuestionScreen(user: widget.user, categoria: widget.categoria, level: widget.level)),
        );

  }
}

/*
     onTap: () { 
        setState((){
          _selected = widget.level.title;
        });       
        print(widget.user.firstname);
        print(widget.user.lastname);   
        print(widget.categoria.title);                
        print(widget.level.title);
        Timer(const Duration(milliseconds: 200), () {
          setState(() {
            _selected = "";
          });
        });
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => 
          Question(user: widget.user, categoria: widget.categoria, level: widget.level)),
        );
        
        }, 

        */
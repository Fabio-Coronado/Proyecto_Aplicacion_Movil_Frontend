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
  String _selected = "";
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
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
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 150,
              //margin: const EdgeInsets.all(3.0),         
              //padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: _selected == widget.level.title ? Border.all(
                  color: Colors.green,
                  width: 4,
                ) : Border.all(
                  color: Colors.grey,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:  AssetImage(widget.level.image),
                  fit: BoxFit.fill,
                ),
              ), 
            ),
          ),          
          Container(
            height: 150,
            alignment: Alignment.center,
            child:Stack(
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
            )
          )
        ]
      ),
      
    );
  }
}
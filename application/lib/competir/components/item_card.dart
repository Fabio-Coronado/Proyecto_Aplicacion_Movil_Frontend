import 'package:application/level/level.dart';
import 'package:application/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/models/categorie.dart';

class ItemCard extends StatefulWidget {
  final User user;
  final Categorie categorie;
  //final Function press;
  const ItemCard({
    Key key,
    this.user,
    this.categorie,
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
          height: 150,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image:  AssetImage(widget.categorie.image),
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
                Text(widget.categorie.title,
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
                Text(widget.categorie.title,
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
    print(widget.categorie.title);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Level(user: widget.user, categoria: widget.categorie)),
    );
  }
}
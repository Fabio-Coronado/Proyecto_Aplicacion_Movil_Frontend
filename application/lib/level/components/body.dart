import 'package:application/models/categorie.dart';
import 'package:application/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/models/levels.dart';
import 'item_card.dart';



class Body extends StatefulWidget {
  final User user;
  final Categorie categoria;
  
  Body({
    Key key,
    this.user,
    this.categoria,
  }): super(key: key); 

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.red,
              child: Text(
                "Elija un Nivel:",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
             child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) => ItemCard(
                  user: widget.user,
                  categoria: widget.categoria,
                  level: levels[index],                  
                ),
              ) 
              )          
          )
        ] ,
    ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:application/models/categorie.dart';

class ItemCard extends StatelessWidget {
  final Categorie categorie;
  final Function press;
  const ItemCard({
    Key key,
    this.categorie,
    this.press
  }
  ):super(key : key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 150,
              //margin: const EdgeInsets.all(3.0),         
              //padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:  AssetImage(categorie.image),
                  fit: BoxFit.fill,
                ),
              ), 
            ),
          ),          
          Container(
            height: 150,
            alignment: Alignment.center,
            child: Text(categorie.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40,
              ),
            )
          )
        ]
      ),
      
    );
  }
}
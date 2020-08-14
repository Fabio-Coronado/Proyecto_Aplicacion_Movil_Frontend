import 'package:application/level/components/body.dart';
import 'package:application/models/categorie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

class Level extends StatelessWidget {
  final User user;
  final Categorie categoria;
  const Level({
    Key key,
    this.user,
    this.categoria,
  }
  ):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Nivel",
            style: GoogleFonts.mcLaren(
              fontSize:30,
            ),
          ), 
          centerTitle: true,
          backgroundColor: Colors.green,    
      ),
      body: Body(user: user, categoria: categoria),
          
    );
  }
}
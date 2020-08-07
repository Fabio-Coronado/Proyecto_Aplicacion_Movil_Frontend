import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/body.dart';


class Competir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Competir",
            style: GoogleFonts.mcLaren(
              fontSize:30,
            ),
          ), 
          centerTitle: true,
          backgroundColor: Colors.green,    
      ),
      body: Body(),
          
    );
  }
}
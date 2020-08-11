import 'package:application/models/user.dart';
import 'package:application/sugerencia/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sugerencia extends StatelessWidget {
  final User user;
  Sugerencia({
    Key key,
    this.user,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sugerencia",
          style: GoogleFonts.mcLaren(
            fontSize:30,
          ),
        ), 
        centerTitle: true,
        backgroundColor: Colors.green, 
      ),
      body: Body(user: user),
    );
  }
}
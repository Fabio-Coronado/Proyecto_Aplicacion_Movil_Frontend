import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formlogin.dart';

class LoginWidgetState extends StatelessWidget{

@override 
  Widget build(BuildContext context){
     return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
              ), 
              onPressed: () => Navigator.pop(context)
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child:SingleChildScrollView(
              child: Column(
                children: <Widget>[                 
                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Ingresar",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mcLaren(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    LoginForm(),   
                ],
              ),          
         
            ),
          )
    )
  );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
      this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
    });
    
  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            width: 300,
            child: Text(
              hintText,
              textAlign: TextAlign.left,
              style: GoogleFonts.mcLaren(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

          ),
        ),
        Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
            width: 300,
            child: TextFormField(
              //cursorColor: Colors.green,
              decoration: InputDecoration(               
                enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color: Colors.green),   
                ),
                focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                ),  
                //hintText: hintText,
                contentPadding: EdgeInsets.all(5.0),
                //border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: isPassword ? true : false,
              validator: validator,
              onSaved: onSaved, 
            ),
          )
        )
      ]
    );
  }
}
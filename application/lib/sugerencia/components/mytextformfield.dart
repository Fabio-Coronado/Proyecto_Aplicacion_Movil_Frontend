import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(2.0),
        child: Container(
            width: 250,
            child: TextFormField(              
              decoration: InputDecoration(    
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey, 
                  fontSize: 12,
                ),
                enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.grey),   
                ),
                focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.green),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.red
                    )
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
              maxLength: 25 ,
            ),
          )
        )
      ]
    );
  }
}

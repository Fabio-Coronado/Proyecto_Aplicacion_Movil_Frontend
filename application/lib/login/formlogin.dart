import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Model {
  String username;
  String password;
Model({this.username, this.password});
}

class Result extends StatelessWidget {
  Model model;
  Result({this.model});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Terminado')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.username, style: TextStyle(fontSize: 22)),
            Text(model.password, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
@override
  Widget build(BuildContext context) {
    //final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
  return Form(
        key: _formKey,
          child: Column(
          children: <Widget>[
                  MyTextFormField(
                    hintText: 'Usuario',
                    isPassword: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingresa el usuario';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.username = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Contraseña',
                    isPassword: true,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingresa la contraseña';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.password = value;
                    },
                  ),
                
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(model: this.model),
                                )
                        );
                      }
                    },
                    child: Text(
                      'Ir',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
          ],
        ),
  );
      
  }
}


class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;

  MyTextFormField({
      this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
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
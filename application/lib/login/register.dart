import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart' as validator;
import "mytextformfield.dart";

class RegisterWidgetState extends StatelessWidget{

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
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "Registrar",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mcLaren(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    RegisterForm(),   
                ],
              ),          
         
            ),
          )
    )
  );
  }
}


class Model {
  String username;
  String password;
  String email;
Model({this.username, this.password, this.email});
}
/*
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
*/
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}


class _RegisterFormState extends State<RegisterForm> {
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
                    hintText: 'Correo',
                    isEmail: true,
                    validator: (String value) {
                      if (!validator.isEmail(value)) {
                        return 'Por favor ingresa un correo válido';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.email = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Contraseña',
                    isPassword: true,
                    validator: (String value) {
                      if (value.length < 7) {
                        return 'La contraseña debe tener más de 7 caracteres';
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                    onSaved: (String value) {
                      model.password = value;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Confirmar contraseña',
                    isPassword: true,
                    validator: (String value) {
                      if (value.length < 7) {
                        return 'La contraseña debe tener más de 7 caracteres';
                      } else if (model.password != null && value != model.password){
                        print(value);
                        print(model.password);
                        return "Las contraseñas no coinciden";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      //model.password = value;
                    },
                  ),
                
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(model: this.model),
                                )
                        );*/
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
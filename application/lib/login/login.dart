import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "mytextformfield.dart";
import 'package:application/home/home.dart';



class LoginWidget extends StatelessWidget{

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

/*
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
*/
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  String _username, _password;
  final _formKey = GlobalKey<FormState>();
  //Model model = Model();
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
                      _username = value;
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
                      _password = value;
                    },
                  ),
                
                  RaisedButton(
                    color: Colors.green,
                    onPressed: SingIn,
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
  

  Future<void> SingIn() async{
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      //await consult to database
      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => Home(user: _username)), (route) => false);
    }


  }
 
}
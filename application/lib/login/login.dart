import 'package:application/models/user.dart';
import 'package:application/services/authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  String _username, _password;
  User user;
  var token;
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
                
                  MaterialButton(
                    color: Colors.grey,
                    onPressed: (){
                      final formState = _formKey.currentState;
                      if (formState.validate()){
                        formState.save();
                        AuthService().login(_username, _password).then((val){
                          if(val.data['success']){
                            token = val.data['token'];
                            Fluttertoast.showToast(
                              msg: 'Bienvenido',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                              );   
                            AuthService().getinfo(token).then((val2){
                              user = User();
                              print(val2.data['username']);
                              user.username = val2.data['username'];                
                              user.firstname = val2.data['firstname'];
                              user.lastname = val2.data['lastname'];
                              user.email = val2.data['email'];
                              user.token = token;
                              user.performance ={
                                "1": val2.data['performance']['1'].toDouble(),
                                "2": val2.data['performance']['2'].toDouble(),
                                "3": val2.data['performance']['3'].toDouble(),
                                "4": val2.data['performance']['4'].toDouble(),
                                "5": val2.data['performance']['5'].toDouble(),

                              };
                           
                              Navigator.pushAndRemoveUntil(context,
                                                    MaterialPageRoute(builder: (context) => Home(user: user)), (route) => false);
                            }); 
                            
                          }
                        });
                           
                      }
                    },
                    child: Text(
                      'Ir',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    splashColor: Colors.green,
                    highlightColor: Colors.green,
                    
                  )
          ],
        ),
  );
      
  }
  
 
}
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class AppWidget extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => MainLoginWidgetState();
}

class MainLoginWidgetState extends State<AppWidget>{
  @override 
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () {
      if (Navigator.canPop(context)) {
                  //Navigator.pop(context);
                  Navigator.of(context).pop();
                } else {
                  SystemNavigator.pop();
                }
        },
          child: Scaffold(
          body: Stack(
            children: <Widget> [
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/fondo_login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ), 
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment(0, -0.4),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        //fit: BoxFit.cover,
                      ),
                    ),
                  )
                ),
              ),
              Positioned.fill(
                top: 350,
                child: Align(
                  alignment: Alignment(0 , 1),
                  child: SafeArea(
                      child: Column(
                        //runSpacing: 16.0,
                        children: <Widget>[
                          new Container(
                            width: 250,
                            height: 50,
                            decoration: new BoxDecoration(
                              color: Colors.green,
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            child: OutlineButton(
                              onPressed: () => {
                                navigateToRegister(context)
                              }, 
                              child: Text("Registrarse"),
                            ),
                          ),
                          SizedBox(height: 10),
                          new Container(
                            width: 250,
                            height: 50,
                            //color: Colors.blue,
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            child: OutlineButton(
                              onPressed: () => debugPrint("OutlinedButton2 presionado"),
                              child: Row(
                                children:[
                                  Icon(FontAwesomeIcons.facebookF),
                                  Expanded(
                                    child: Text("Continuar con Facebook",
                                    textAlign: TextAlign.center
                                    ),
                                  ),
                                ]
                              ), 
                            ),
                          ),
                          SizedBox(height: 10),
                          new Container(
                            width: 250,
                            height: 50,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            child: OutlineButton(
                              onPressed: () => debugPrint("OutlinedButton2 presionado"),
                              child: Row(
                                children:[
                                  Icon(FontAwesomeIcons.google),
                                  Expanded(
                                    child: Text("Continuar con Gmail",
                                    textAlign: TextAlign.center
                                    ),
                                  ),
                                ]
                              ), 
                            ),
                          ),
                          SizedBox(height: 10),
                          new Container(
                            width: 250,
                            height: 20,
                            child: Text("¿Tienes un usuario?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white),
                              ),
                            ),
                          SizedBox(height: 10),
                          new Container(
                            width: 250,
                            height: 50,
                            decoration: new BoxDecoration(
                              color: Colors.orange,
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            child: OutlineButton(
                              onPressed: () => {
                                navigateToLogin(context)
                              },                      
                              child: Row(
                                children:[
                                  Expanded(
                                    child: Text("Ingresar",
                                    textAlign: TextAlign.center
                                    ),
                                  ),
                                ]
                              ), 
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

  Future navigateToLogin(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidget()));
  }

  Future navigateToRegister(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterWidget()));
  }
}
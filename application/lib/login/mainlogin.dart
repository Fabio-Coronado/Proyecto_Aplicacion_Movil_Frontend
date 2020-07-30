import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/main.dart';
import 'login.dart';

class MainLoginWidgetState extends State<AppWidget>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
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
              alignment: Alignment(-0.5, -0.5),
              child: Container(
                width: 150,
                height: 150,
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
            child: Align(
              alignment: Alignment(0 , 0.7),
              child: SafeArea(
                  child: Wrap(
                    runSpacing: 16.0,
                    children: <Widget>[
                      new Container(
                        width: 250,
                        height: 50,
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        child: OutlineButton(
                          onPressed: () => debugPrint("OutlinedButton presionado"),
                          child: Text("Registrarse"),
                        ),
                      ),
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
                      new Container(
                        width: 250,
                        height: 20,
                        child: Text("¿Tienes un usuario?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white),
                          ),
                        ),
                      new Container(
                        width: 250,
                        height: 50,
                        decoration: new BoxDecoration(
                          color: Colors.orange,
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        child: OutlineButton(
                          onPressed: () => {
                            navigateToSubPage(context)
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
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidgetState()));
  }
}
import 'package:application/home/home.dart';
import 'package:application/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultpage extends StatefulWidget {
  final int marks;
  final User user;
  Resultpage({Key key , @required this.marks, @required this.user}) : super(key : key);
  @override
  _ResultpageState createState() => _ResultpageState(marks);
}

class _ResultpageState extends State<Resultpage> {

  List<String> images = [
    "assets/puntuacion/buena.jpg",
    "assets/puntuacion/regular.jpg",
    "assets/puntuacion/mala.jpg",
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks <= 20){
      image = images[2];
      message = "Deberías esforzarte..\n" + "Tu puntuación fue $marks";
    }else if(marks <= 40){
      image = images[1];
      message = "Puedes hacerlo mejor..\n" + "Tu puntuación fue $marks";
    }else{
      image = images[0];
      message = "Lo hiciste muy bien..\n" + "Tu puntuación fue $marks";
    }
    super.initState();
  }

  int marks;
  _ResultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
          child: Scaffold(
          appBar: AppBar(
          title: Text(
            "Resultado",
            style: GoogleFonts.mcLaren(
              fontSize:30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Material(
                elevation: 10.0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          child: ClipRect(
                            child: Image(
                              image: AssetImage(
                                image,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 18.0,
                            //fontFamily: "Quando",
                          ),
                        ),
                      )
                      ),
                    ],
                  ),
                ),
              ),            
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    onPressed: (){
                      //actualizar marca del usuario
                     Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) => Home(user: user)), (route) => false);
                    },
                    child: Text(
                      "Regresar al Inicio",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    borderSide: BorderSide(
                      width: 3.0, 
                      color: Colors.grey),
                    splashColor: Colors.green,
                    highlightedBorderColor: Colors.green,
                    
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
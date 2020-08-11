import 'package:application/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({
    Key key,
    this.user,
    this.curiosity
  }): super(key: key);
  final User user;
  final String curiosity;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    //color: Colors.blue,
                    child: Text("¡Hola ${this.user.firstname} ${this.user.lastname}!",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),               
                Container(
                  color: Colors.red,
                  child: Text("Curiosidad del día:",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),  
                //Curiosidad del dia
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[                     
                        
                        Container(
                          child: Text("Titulo",
                          style: TextStyle(
                            fontSize: 20,

                          ),
                          textAlign: TextAlign.center,
                          )
                        ),
                        Container(
                          child: Text(this.curiosity,
                          textAlign: TextAlign.justify
                          ),
                        )
                    
                      ],
                    ),
                  ),
                ),
                //Noticias
                Container(
                  color: Colors.red,
                  child: Text("Noticias:",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),     
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child:   Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("Titulo noticia",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                          )
                        ),
                        Container(
                          child: Text(this.curiosity,
                          textAlign: TextAlign.justify
                          ),
                        )
                      
                      ],
                    ),              
                  ),
                ),
              ],
            ),
          )
                //Noticias de la aplicaccion
              
    );
  }
}
import 'package:application/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Principal extends StatelessWidget {
  const Principal({
    Key key,
    this.user,
    this.curiosity,
    this.news
  }): super(key: key);
  final User user;
  final String curiosity;
  final String news;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
            child: ListView( 
              padding: const EdgeInsets.only(
                  top: 10.0
                ),            
              children: <Widget>[        
                Container(
                  //color: Colors.red,
                  child: Text("Dato del día:",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),  
                //Curiosidad del dia
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: const Color(0xff7c94b6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 8,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      //borderRadius: BorderRadius.circular(12),
                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[                                           

                          Container(
                            child: HtmlWidget(curiosity,
                            
                            )
                          )                    
                        ],
                      ),
                    ),
                  ),
                ),
                //Noticias
                Container(                  
                  child: Text("Noticias:",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),     
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child:   Container(
                    child: Column(
                      children: <Widget>[

                        Container(
                          child: HtmlWidget(news)
                        )
                      
                      ],
                    ), 
                    decoration: BoxDecoration(
                      //color: const Color(0xff7c94b6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 8,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      //borderRadius: BorderRadius.circular(12),
                    ) ,             
                  ),
                ),
              ],
            ),
          )
                //Noticias de la aplicaccion
              
    );
  }
}
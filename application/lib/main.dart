import 'package:google_fonts/google_fonts.dart';

import 'login/mainlogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainWidget());

class MainWidget extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
      textTheme: GoogleFonts.mcLarenTextTheme(
            Theme.of(context).textTheme,
          ),
        cursorColor: Colors.green,
        textSelectionHandleColor: Colors.green, 
      ),
      home: AppWidget(),
    );
  }

}

class AppWidget extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() => MainLoginWidgetState();
}




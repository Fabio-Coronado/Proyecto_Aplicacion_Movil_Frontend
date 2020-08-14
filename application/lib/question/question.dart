import 'package:application/data/probequestion.dart';
import 'package:application/models/categorie.dart';
import 'package:application/models/levels.dart';
import 'package:application/models/user.dart';
import 'package:application/question/components/quizpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//var formKeys = new List<GlobalKey<FormState>>.generate(questions.length, (n) => GlobalKey<FormState>());

class Question extends StatefulWidget {
  final User user;
  final Categorie categoria;
  final Level level;
  //List<Question> question;
  //final Function press;
  Question({
    Key key,
    this.user,
    this.categoria,
    this.level,   
    //this.press
  }
  ):super(key : key);
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  @override
  void initState() {
    // busca con la categoria y el nivel una lista de preguntas
    //widget.question = questions;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Quizpage(questions: questions, user: widget.user);
     
   }
}


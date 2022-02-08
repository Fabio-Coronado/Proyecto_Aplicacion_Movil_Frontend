import 'package:application/data/probequestion.dart';
import 'package:application/data/probequestion2.dart';
import 'package:application/data/probequestion3.dart';
import 'package:application/data/probequestion4.dart';
import 'package:application/data/probequestion5.dart';
import 'package:application/models/categorie.dart';
import 'package:application/models/levels.dart';
import 'package:application/models/user.dart';
import 'package:application/models/question.dart';
import 'package:application/question/components/quizpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//var formKeys = new List<GlobalKey<FormState>>.generate(questions.length, (n) => GlobalKey<FormState>());

class QuestionScreen extends StatefulWidget {
  final User user;
  final Categorie categoria;
  final Level level;
  //List<Question> question;
  //final Function press;
  QuestionScreen({
    Key key,
    this.user,
    this.categoria,
    this.level,   
    //this.press
  }
  ):super(key : key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  void initState() {
    // busca con la categoria y el nivel una lista de preguntas
    //widget.question = questions;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Quizpage(questions: questionsSend(widget.categoria), user: widget.user, categoria: widget.categoria);
     
   }

   List<Question> questionsSend(Categorie categoria){

     var elements = new List<Question>();
     if(categoria.title == "Matemática"){
        questions.shuffle();
        for (int i = 0; i < 5; i++){
          elements.add(questions[i]);
        }


     } else if(categoria.title == "Ciencia y Naturaleza"){
        questions2.shuffle();
        for (int i = 0; i < 5; i++){
          elements.add(questions2[i]);
        }


     } else if(categoria.title == "Animales"){
        questions3.shuffle();
        for (int i = 0; i < 5; i++){
          elements.add(questions3[i]);
        }

     }else if(categoria.title == "Geografía"){
        questions4.shuffle();
        for (int i = 0; i < 5; i++){
          elements.add(questions4[i]);
        }

     }else if(categoria.title == "Computación"){
        questions5.shuffle();
        for (int i = 0; i < 5; i++){
          elements.add(questions5[i]);
        }
        
     }

    return elements;  

  
}

}
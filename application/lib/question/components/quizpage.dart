import 'dart:async';
import 'dart:math';
import 'package:application/home/home.dart';
import 'package:application/models/question.dart';
import 'package:application/models/user.dart';
import 'package:application/question/components/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quizpage extends StatefulWidget {
   final List<Question> questions;
   final User user;


  Quizpage({Key key, @required this.questions, @required this.user}) : super(key: key);
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  Timer _clockTimer;
  Color colortoshow = Colors.grey;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 0;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  var random_array;

  Map<int, Color> btncolor = {
    1: Colors.grey,
    2: Colors.grey,
    3: Colors.grey,
    4: Colors.grey,
  };

  bool canceltimer = false;

  genrandomarray(){
    
    var distinctIds = [];
    var rand = new Random();
      for (int z = 0; ;) {
      distinctIds.add(rand.nextInt(widget.questions.length));
        random_array = distinctIds.toSet().toList();
        if(random_array.length < widget.questions.length){
          continue;
        }else{
          break;
        }
      }
      i = random_array[0];
      print(random_array);
  }
  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    super.dispose();
  }
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    _clockTimer = Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < widget.questions.length) {
        i = random_array[j];
        print(i);
        j++;
      } else {
       goResult(context, widget.user, marks);
      }
      btncolor[1] = Colors.grey;
      btncolor[2] = Colors.grey;
      btncolor[3] = Colors.grey;
      btncolor[4] = Colors.grey;
      disableAnswer = false;
    });
    starttimer();
  }

    void checkanswer(int k) {
    

    if (widget.questions[i].correct == k) {
      marks = marks + 20;

      colortoshow = right;
    } else {

      colortoshow = wrong;
    }
    setState(() {

      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });

    Timer(Duration(milliseconds: 1000), nextquestion);
  }
  Widget choicebutton(int k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          widget.questions[i].alternativas[k-1].content,
          style: TextStyle(
            color: Colors.white,
            //fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.grey[700],
        highlightColor: Colors.grey[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () => showDialog<bool>(
            
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Advertencia'),
                content: Text('Perderás 20 puntos en esta categoría. ¿Realmente deseas salir?'),
                actions: [
                  FlatButton(
                    child: Text('Si'),
                    //Regresar a home con el usuario con 20 puntos menos
                    onPressed: () => PopA(context, widget.user)
                  ),
                  FlatButton(
                    //
                    child: Text('No'),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ],
              ),
          ),
          child: Scaffold(
            body: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.questions[i].content,
                    style: TextStyle(
                      fontSize: 16.0,
                     
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: AbsorbPointer(
                    absorbing: disableAnswer,
                      child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          choicebutton(1),
                          choicebutton(2),
                          choicebutton(3),
                          choicebutton(4),
                        ],
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Text(
                      showtimer,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
        ),
          ),
    );
  }
  
  Future<void> PopA(context, User user) async{
        //canceltimer = true;
        Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) => Home(user: user)), (route) => false);

  }

  Future<void> goResult(context, User user, marks) async{
        //canceltimer = true;
        Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
          builder: (context) => Resultpage(user: widget.user, marks: marks)),
          (route) => false
        );

  }
}


      
    


  
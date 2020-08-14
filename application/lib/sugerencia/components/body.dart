import 'mytextformfield.dart';
import 'package:application/models/categorie.dart';
import 'package:application/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  final User user;
  Body({
    Key key,
    this.user,
  }): super(key: key); 

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  
  
  @override
    Widget build(BuildContext context) {
      return Container(
        child: DropdownBtn(),
        //DropDownBtn();
      );
    }

}


class DropdownBtn extends StatefulWidget {
  @override
  _DropdownBtnState createState() => _DropdownBtnState();
}

class _DropdownBtnState extends State<DropdownBtn> {
  final _formKey = GlobalKey<FormState>();
  var _categoria = "";
  var _alternativa1 ="";
  var _alternativa2 ="";
  var _alternativa3 ="";
  var _alternativa4 ="";
  var _hint = "Escoge una categoría";
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 5), 
                  Container(
                    child: Text(
                      "Categoría: ",
                      style: TextStyle(
                        fontSize: 18 
                      )
                    )
                  ),
                  //Container de la barra desplegable
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 250,
                    decoration: BoxDecoration(
                       color: Colors.grey[200],
                       borderRadius: BorderRadius.circular(7.0),
                    ),
                    //width: 200,
                    //padding: EdgeInsets.all(8.0),
                    //alignment: Alignment.center,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red
                            )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green
                          )
                        ),

                      ),
                      items: categories.map((categorie) {
                        return DropdownMenuItem<String>(
                          child: Container(
                            width: 200,
                            child: Text(categorie.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              
                              color: Colors.black87,
                              
                              ),
                            ),
                          ),
                          value: categorie.title,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _categoria = value;
                          _hint = value;
                        });
                      },
                      hint: Text(
                        _hint,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          //color: Colors.black87,
                        ),                    
                      ),
                      elevation: 2,
                      iconEnabledColor: Colors.green,
                      dropdownColor: Colors.grey[200],
                      validator: (String value) {
                        if (value == null) {
                          return 'Por favor escoja una categoría';
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                      //: Colors.green,
                      focusColor: Colors.green,
                      //disabledHint: true,                
                      //isExpanded: false,
                    ),
                  ),
                  SizedBox(height: 5), 
                  Container(
                    child: Text("Pregunta: ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                         //color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Ingrese la pregunta';
                          }
                          _formKey.currentState.save();
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText:'Escribe la pregunta',
                           hintStyle: TextStyle(
                            //color: Colors.grey, 
                            
                            fontSize: 18,
                          ),
                          enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey
                            ),   
                        ),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.green),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red
                            )
                        ),  
                        //hintText: hintText,
                        contentPadding: EdgeInsets.all(5.0),
                        //border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200],
                          
                        ),
                        maxLines: 3,
                        maxLength: 100,

                      ),
                    ),
                  ),
                  SizedBox(height: 5), 
                  //alternativas
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      child: Text("Alternativas: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      )
                    ),
                  ),

                  MyTextFormField(
                    hintText: 'Alternativa 1',
                    isPassword: false,
                    isEmail: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese la alternativa';
                      } else {
                        print(value);
                        _alternativa1 = value;

                      }
                      return null;
                    },

                  ),
                  MyTextFormField(
                    hintText: 'Alternativa 2',
                    isPassword: false,
                    isEmail: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese la alternativa';
                      } else {
                        print(value);
                        _alternativa2 = value;

                      }
                      return null;
                    },

                  ),
                  MyTextFormField(
                    hintText: 'Alternativa 3',
                    isPassword: false,
                    isEmail: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese la alternativa';
                      } else {
                        print(value);
                        _alternativa3 = value;

                      }
                      return null;
                    },

                  ),
                  MyTextFormField(
                    hintText: 'Alternativa 4',
                    isPassword: false,
                    isEmail: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese la alternativa';
                      } else {
                        print(value);
                        _alternativa4 = value;

                      }
                      return null;
                    },

                  ),

                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(model: this.model),
                                )
                        );*/                     
                      }
                    },
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      );
  }
}
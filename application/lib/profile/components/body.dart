import 'dart:math';
import 'package:application/login/mytextformfield.dart';
import 'package:application/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'package:multi_charts/multi_charts.dart';

double maximo(Map<int, double> lista){
    double maximo = 0.0;
    List<double> sortedKeys = lista.values.toList(growable:false);
    maximo = sortedKeys.reduce(max);
    return maximo;
} 

double total(Map<int, double> lista){
    double maximo = 0.0;
    List<double> sortedKeys = lista.values.toList(growable:false);
    maximo = sortedKeys.reduce((a, b) => a + b);
    return maximo;
} 


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
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget> [
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 100,
                        child: CircleAvatar(
                          radius: 95,
                          //backgroundColor: Colors.red,
                          backgroundImage: AssetImage(widget.user.image),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${widget.user.firstname} ${widget.user.lastname}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${widget.user.correo}",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Record: ${total(widget.user.performance)} puntos",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 50,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.green,
                  tabs: [
                    Tab(
                      child: Text(
                        "Editar Datos",
                        style: TextStyle(
                          color: Colors.black,
                        )
                      ),                         
                    ),
                    Tab(
                      child: Text(
                        "Desempeño",
                        style: TextStyle(
                          color: Colors.black,
                        )
                      ),                             
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Tab(
                        child: ListView(
                            children: <Widget >[
                            SizedBox(height: 20),
                            ExpansionTile(
                              title: Text("Cambiar nombre"),
                              children: <Widget> [
                                EditData(),                           
                              ]
                            ),
                            Divider(),
                            ExpansionTile(
                              title: Text("Cambiar contraseña"),
                              children: <Widget> [
                                EditPassword(),                           
                              ]
                            ),
                            ]
                        ),
                          
                      ),
                      Tab(
                        child: Rendimiento(user: widget.user),
                      ),

                    ],
                  ),
                ),
              ),     
        ]
      ),        
    );
  }
}

class Model {
  String firstname;
  String lastname;
Model({this.firstname, this.lastname});
}


class EditData extends StatefulWidget {
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                MyTextFormField(
                  hintText: 'Nuevo nombre',
                  isPassword: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Ingresa el nuevo nombre';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.firstname = value;
                  },
                ),
                MyTextFormField(
                  hintText: 'Nuevo Apellido',
                  isEmail: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Ingresa el nuevo apellido';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.lastname = value;
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
                      //cambiar nuevo nombre
                    }
                    
                  },
                  child: Text(
                    'Guardar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
        ),
          ),
  );
  }
}

class ModelPassword {
  String password;
  String newpassword;
  String repeatnewpassword;
  ModelPassword({this.password, this.newpassword, this.repeatnewpassword});
}

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final _formKey = GlobalKey<FormState>();
  ModelPassword model = ModelPassword();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
                      child: Column(
              children: <Widget>[
                                    MyTextFormField(
            hintText: 'Contraseña anterior',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'La contraseña debe tener más de 7 caracteres';
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              model.password = value;
            },
                      ),
                      MyTextFormField(
            hintText: 'Nueva Contraseña',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'La contraseña debe tener más de 7 caracteres';
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              model.newpassword = value;
            },
                      ),
                      MyTextFormField(
            hintText: 'Confirmar nueva contraseña',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'La contraseña debe tener más de 7 caracteres';
              } else if (model.newpassword != null && value != model.repeatnewpassword){
                print(value);
                print(model.newpassword);
                return "Las contraseñas no coinciden";
              }
              return null;
            },
            onSaved: (String value) {
              //model.password = value;
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
              'Guardar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
                      )
              ],
        ),
          ),
  );
  }
}

class Rendimiento extends StatelessWidget {
  final User user;
  Rendimiento({
    Key key,
    this.user,
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
            width: 450,
            height: 450,
            //Radar Chart
            child: RadarChart(
              values: [user.performance[1], user.performance[2], 
              user.performance[3], 
              user.performance[4], user.performance[5]],
              labels: [
                "Matemática",
                "Física",
                "Química",
                "Biología",
                "Informática",
              ],
              maxValue: maximo(user.performance),
              fillColor: Colors.blue,
              chartRadiusFactor: 0.7,
            ),
    );
  }
}
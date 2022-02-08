import 'dart:math';
import 'package:application/login/mytextformfield.dart';
import 'package:application/models/user.dart';
import 'package:application/services/authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/models/categorie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart' as validator;
import 'package:multi_charts/multi_charts.dart';

double maximo(Map<String, double> lista){
    double maximo = 0;
    List<double> sortedKeys = lista.values.toList(growable:false);
    maximo = sortedKeys.reduce(max);

    return maximo;
} 

double total(Map<String, double> lista){
    double maximo = 0;
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
    AuthService().getinfo(widget.user.token).then((val2){
    widget.user.username = val2.data['username'];                
    widget.user.firstname = val2.data['firstname'];
    widget.user.lastname = val2.data['lastname'];
    widget.user.email = val2.data['email'];
    widget.user.performance ={
      "1": val2.data['performance']['1'].toDouble(),
      "2": val2.data['performance']['2'].toDouble(),
      "3": val2.data['performance']['3'].toDouble(),
      "4": val2.data['performance']['4'].toDouble(),
      "5": val2.data['performance']['5'].toDouble(),

    };
  
    
  }); 
    _tabController = TabController(vsync: this, length: 2);
  }

  _updateUser(User edituser){
    setState(() {
    widget.user.firstname = edituser.firstname;
    widget.user.lastname = edituser.lastname;
    });
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
                          backgroundImage: AssetImage('assets/users/user_default.png'),
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
                        "${widget.user.email}",
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
                        "Puntos totales: ${total(widget.user.performance)} puntos",
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
                                EditData(username: widget.user.username,
                                  editUser: _updateUser
                                ),                           
                              ]
                            ),
                            Divider(),
                            ExpansionTile(
                              title: Text("Cambiar contraseña"),
                              children: <Widget> [
                                EditPassword(username: widget.user.username),                           
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
  final String username;
  final ValueChanged<User> editUser;
  EditData({
    Key key,
    this.username,
    this.editUser
  }): super(key: key); 
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
                    
                MaterialButton(
                  splashColor: Colors.green,
                  highlightColor: Colors.green,
                  color: Colors.grey,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                     AuthService().changeName(widget.username, model.firstname, model.lastname).then((val){
                        if(val.data['success']){
                            Fluttertoast.showToast(
                              msg: val.data['msg'],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                              );
                              User newdatauser = User();
                              newdatauser.firstname = model.firstname;
                              newdatauser.lastname = model.lastname;
                              widget.editUser(newdatauser);
                        }
                     });
                     
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
  final String username;
  EditPassword({
    Key key,
    this.username,
  }); 
  
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
              } else if (model.newpassword != null && value != model.newpassword){
                
                return "Las contraseñas no coinciden";
              }
              return null;
            },
            onSaved: (String value) {
              model.repeatnewpassword = value;
            },
                      ),
                    
            MaterialButton(
            splashColor: Colors.green,
            highlightColor: Colors.green,
            color: Colors.grey,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
               AuthService().changePassword(widget.username, model.password, model.newpassword).then((val){
                 if(val.data['success']){
                  Fluttertoast.showToast(
                    msg: val.data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                    );   

                 }
               });
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

class Rendimiento extends StatefulWidget {
  final User user;
  Rendimiento({
    Key key,
    this.user,
  }): super(key: key);

  @override
  _RendimientoState createState() => _RendimientoState();
}

class _RendimientoState extends State<Rendimiento> {
  @override
  Widget build(BuildContext context) {
    return Container(
            width: 450,
            height: 450,
            //Radar Chart
            child: RadarChart(

              values: [
              widget.user.performance["1"], widget.user.performance["2"], 
              widget.user.performance["3"], 
              widget.user.performance["4"], widget.user.performance["5"]
              
              ],
              labels: [
                categories[0].title,
                categories[1].title,
                categories[2].title,
                categories[3].title,
                categories[4].title,
              ],
              maxValue: maximo(widget.user.performance),
              fillColor: Colors.blue,
              chartRadiusFactor: 0.7,
              
  
            ),
    );
  }
}
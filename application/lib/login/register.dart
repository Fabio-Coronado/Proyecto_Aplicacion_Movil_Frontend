import 'package:application/home/home.dart';
import 'package:application/models/user.dart';
import 'package:application/services/authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart' as validator;
import "mytextformfield.dart";

class RegisterWidget extends StatelessWidget{

@override 
  Widget build(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
              ), 
              onPressed: () => Navigator.pop(context)
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child:Column(
              children: <Widget>[                 
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      "Registrar",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mcLaren(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        RegisterForm()                    
                      ],
                    ),
                  ),
              ]
            )
          )
        )
    );
  }
}


class Model {
  String username;
  String firstname;
  String lastname;
  String password;
  String email;
Model({this.username, this.firstname, this.lastname, this.password, this.email});
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}


class _RegisterFormState extends State<RegisterForm> {
  var token;
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
@override
  Widget build(BuildContext context) {
    //final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
  return Form(
        key: _formKey,
          child: Column(
            children: <Widget>[
                    MyTextFormField(
          hintText: 'Usuario',
          isPassword: false,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Ingresa el usuario';
            }
            return null;
          },
          onSaved: (String value) {
            model.username = value;
          },
                    ),
                    MyTextFormField(
          hintText: 'Nombre',
          isPassword: false,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Ingresa el Nombre';
            }
            return null;
          },
          onSaved: (String value) {
            model.firstname = value;
          },
                    ),
                    MyTextFormField(
          hintText: 'Apellido',
          isPassword: false,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Ingresa el Apellido';
            }
            return null;
          },
          onSaved: (String value) {
            model.lastname = value;
          },
                    ),
                    MyTextFormField(
          hintText: 'Correo',
          isEmail: true,
          validator: (String value) {
            if (!validator.isEmail(value)) {
              return 'Por favor ingresa un correo válido';
            }
            return null;
          },
          onSaved: (String value) {
            model.email = value;
          },
                    ),
                    MyTextFormField(
          hintText: 'Contraseña',
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
          hintText: 'Confirmar contraseña',
          isPassword: true,
          validator: (String value) {
            if (value.length < 7) {
              return 'La contraseña debe tener más de 7 caracteres';
            } else if (model.password != null && value != model.password){
              print(value);
              print(model.password);
              return "Las contraseñas no coinciden";
            }
            return null;
          },
          onSaved: (String value) {
            //model.password = value;
          },
                    ),
                  
          MaterialButton(
          splashColor: Colors.green,
          highlightColor: Colors.green,
          color: Colors.grey,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              var token;
              AuthService().addUser(model.username, model.password, model.email, model.firstname, model.lastname).then((val){
              if(val.data['success']){
                token = val.data['token'];
                print(token);
                Fluttertoast.showToast(
                  msg: val.data['msg'],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
                  );
                   AuthService().getinfo(token).then((val2){
                    User user = User();
                    print(val2.data['username']);
                    user.username = val2.data['username'];                
                    user.firstname = val2.data['firstname'];
                    user.lastname = val2.data['lastname'];
                    user.email = val2.data['email'];
                    user.token = token;
                    user.performance ={
                      "1": val2.data['performance']['1'].toDouble(),
                      "2": val2.data['performance']['2'].toDouble(),
                      "3": val2.data['performance']['3'].toDouble(),
                      "4": val2.data['performance']['4'].toDouble(),
                      "5": val2.data['performance']['5'].toDouble(),

                    };
                  
                    Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (context) => Home(user: user)), (route) => false);
                  }); 
              }
              }
            );
            }
          },
          child: Text(
            'Ir',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
                    )
            ],
        ),
  );
      
  }
}
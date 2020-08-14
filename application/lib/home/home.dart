import 'package:application/competir/competir.dart';
import 'package:application/login/mainlogin.dart';
import 'package:application/models/user.dart';
import 'package:application/profile/profile.dart';
import 'package:application/sugerencia/sugerencia.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'principal.dart';


String curiosity = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
class Home extends StatefulWidget{
  const Home({
    Key key,
    @required this.user
  }): super(key: key);
  final User user;
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(250.0),
            child: Stack(
              children: <Widget>[AppBar(
              centerTitle: true,
              backgroundColor: Colors.green,         
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0
                  ),
                  child: Container(
                    //color: Colors.red,
                    height: 250,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hola ${widget.user.firstname} ${widget.user.lastname}",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white
                        ),
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
                  
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),

          ),
                          ]),
        ),
        body: Principal(user: widget.user, curiosity: curiosity),
        drawer: LateralMenu(user: widget.user),
      );
   
  }
}

class LateralMenu extends StatelessWidget{
  const LateralMenu({
    Key key,
    this.user
  }): super(key: key);
  final User user;
  @override 
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Drawer(        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("${user.firstname} ${user.lastname}"), 
              accountEmail: Text(user.correo),
              currentAccountPicture: new CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(user.image),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Principal'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.play),
              title: Text('Competir'),
              onTap: () => {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Competir(user: user)),
              )
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Perfil'),
              onTap: () => { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(user: user)),
              )},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Sugerencia'),
              onTap: () => {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Sugerencia(user: user)),
              )},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () => {             
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppWidget())),
                
                },
            ),
          
          ],
        ),
      )
    );
    
  }

}



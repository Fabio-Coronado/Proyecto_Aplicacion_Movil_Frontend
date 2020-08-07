import 'package:application/competir/competir.dart';
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
  final String user;
  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Principal",
            style: GoogleFonts.mcLaren(
              fontSize:30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
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
  final String user;
  @override 
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Drawer(        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(user), 
              accountEmail: Text("${this.user}@correo.pe"),
              currentAccountPicture: new CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                //backgroundImage:
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
                MaterialPageRoute(builder: (context) => Competir()),
              )
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Perfil'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Sugerencia'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          
          ],
        ),
      )
    );
    
  }

}



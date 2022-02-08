import 'package:application/competir/competir.dart';
import 'package:application/login/mainlogin.dart';
import 'package:application/models/user.dart';
import 'package:application/profile/profile.dart';
import 'package:application/services/authservice.dart';
import 'package:application/sugerencia/sugerencia.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'principal.dart';

Future<void> _showAlert(BuildContext context) {
      showDialog<bool>(
           context: context,
              builder: (context) => AlertDialog(
                title: Text('Advertencia'),
                content: Text('¿Regresar a la pantalla de inicio?'),
                actions: [
                  FlatButton(
                    child: Text('Si'),
                    //Regresar a home con el usuario con 20 puntos menos
                    onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AppWidget()), (route) => false),
                  ),
                  FlatButton(
                    //
                    child: Text('No'),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ],
              ),
      );
    }

String curiosity;
String  news;
Future<dynamic> getCuriosityAndNews() async{
      await AuthService().curiosity().then((val){
        curiosity = val.toString();

      });
      await AuthService().news().then((val1){
        news = val1.toString();
        
      });
      if (news != null && curiosity != null){

        return true;
      }

}

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
  
  _updateuser(User tempuser) {
    setState(() {
      widget.user.username = tempuser.username;                
      widget.user.firstname = tempuser.firstname;
      widget.user.lastname = tempuser.lastname;
      widget.user.email = tempuser.email;
      widget.user.performance ={
        "1": tempuser.performance['1'],
        "2": tempuser.performance['2'],
        "3": tempuser.performance['3'],
        "4": tempuser.performance['4'],
        "5": tempuser.performance['5'],
      };

    });
  }
  @override
  void initState() {
 
    super.initState();
  }
  
  @override 
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () => _showAlert(context),
          child: Scaffold(
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
          body: FutureBuilder(
            future: getCuriosityAndNews(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(!snapshot.hasData){
                return Center(
                child: CircularProgressIndicator()
                );
              } else{
                return Principal(user: widget.user, curiosity: curiosity, news: news);
              }
              
          },
          ),
          //Principal(user: widget.user, curiosity: curiosity, news: news,),
          drawer: LateralMenu(user: widget.user, updateuser: _updateuser),
        ),
    );
   
  }
}

class LateralMenu extends StatefulWidget{
  const LateralMenu({
    Key key,
    this.user,
    this.updateuser,
  }): super(key: key);
  final User user;
  final ValueChanged<User> updateuser;

  @override
  _LateralMenuState createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {


    void initState() {
    super.initState();
    AuthService().getinfo(widget.user.token).then((val){

      widget.user.username = val.data['username'];                
      widget.user.firstname = val.data['firstname'];
      widget.user.lastname = val.data['lastname'];
      widget.user.email = val.data['email'];
      widget.user.performance ={
        "1": val.data['performance']['1'].toDouble(),
        "2": val.data['performance']['2'].toDouble(),
        "3": val.data['performance']['3'].toDouble(),
        "4": val.data['performance']['4'].toDouble(),
        "5": val.data['performance']['5'].toDouble(),
        
      };
    });
   
  }
  @override 
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Drawer(        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("${widget.user.firstname} ${widget.user.lastname}"), 
              accountEmail: Text(widget.user.email),
              currentAccountPicture: new CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('assets/users/user_default.png'),
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
                MaterialPageRoute(builder: (context) => Competir(user: widget.user)),
              )
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Perfil'),
              onTap: () => { 
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(user: widget.user)),
              ).then((value) => setState(() => {
                 widget.updateuser(widget.user)
              }))
              },
            ),
           
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Sugerir pregunta'),
              onTap: () => {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Sugerencia(user: widget.user)),
              )},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () =>{_showAlert(context)}
            ),
          
          ],
        ),
      )
    );
    
  }

}



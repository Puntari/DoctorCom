import 'package:doctor_com/screens/about.dart';
import 'package:doctor_com/screens/camera.dart';
import 'package:doctor_com/screens/contents.dart';
import 'package:doctor_com/screens/showmenu.dart';
import 'package:flutter/material.dart';

import 'contact.dart';

class Homemenu extends StatefulWidget {
  @override
  _HomemenuState createState() => _HomemenuState();
}

class _HomemenuState extends State<Homemenu> {
  //Explicit

  Widget myWidget = ShowMenu();

  //Method
  Widget menuShowMenu() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: 35.0,
        color: Colors.grey,
      ),
      title: Text(
        'Operatingsystem',
        style: TextStyle(fontSize: 14.0),
      ),
      onTap: () {
        setState(() {
          myWidget = ShowMenu();
          Navigator.of(context).pop();
        });
      },
    );
  }

   Widget menuShowcontents() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: 35.0,
        color: Colors.grey,
      ),
      title: Text(
        'contents',
        style: TextStyle(fontSize: 14.0),
      ),
     onTap: () {
       setState(() {
         myWidget = ShowContents ();
         Navigator.of(context).pop();
       });
     },
    );
  }


  Widget menuShowcamera(){
    return ListTile(
      leading: Icon(
        Icons.photo_camera,
        size: 35.0,
        color: Colors.grey,
      ),
      title: Text(
        'Camera',
        style: TextStyle(fontSize: 14.0),
      ),
      onTap: () {
        setState(() {
          myWidget = ShowCamera();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuShowcontact() {
    return ListTile(
      leading: Icon(
        Icons.contact_phone,
        size: 35.0,
        color: Colors.grey,
      ),
      title: Text(
        'Contact',
        style: TextStyle(fontSize: 14.0),
      ),
      onTap: () {
        setState(() {
          myWidget = ShowContact();
          Navigator.of(context).pop();
        });
      },
    );
  }

   Widget menuShowabout() {
    return ListTile(
      leading: Icon(
        Icons.info,
        size: 35.0,
        color: Colors.grey,
      ),
      title: Text(
        'about',
        style: TextStyle(fontSize: 14.0),
      ),
     onTap: () {
       setState(() {
         myWidget = ShowAbout();
         Navigator.of(context).pop();
       });
     },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget showDrawMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMenu(),
          menuShowMenu(),
          menuShowcontents(),
          menuShowcamera(),
          menuShowcontact(),
          menuShowabout(),
        ],
      ),
    );
  }

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.yellow[100], Colors.yellow[900]],
          radius: 1.0,
          center: Alignment.center,
        ),
      ), //พื้นหลังด้านกล่องบน
      child: Column(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            child: Image.asset('images/lg.png'),
          ), //โชว์รูป
          Text(
            'DOCTORCOM',
            style: TextStyle(
              color: Colors.blue[900],
              fontFamily: 'AmaticSC',
              fontSize: 35.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DoctorCom'),
      ),
      body: myWidget,
      drawer: showDrawMenu(),
    );
  }
}

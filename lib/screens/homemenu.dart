import 'package:Doctorcom/screens/about.dart';
import 'package:Doctorcom/screens/camera.dart';
import 'package:Doctorcom/screens/contents.dart';
import 'package:Doctorcom/screens/showmenu.dart';
import 'package:Doctorcom/settingKorgPly/search_problem.dart';
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
  Widget myDivider() {
    return Divider(
      height: 8.0,
      color: Colors.grey,
    );
  } //เส้นขั้น

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
        Icons.book,
        size: 35.0,
        color: Colors.grey,
      ),
      title: Text(
        'Contents',
        style: TextStyle(fontSize: 14.0),
      ),
      onTap: () {
        setState(() {
          myWidget = ShowContents();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget menuShowcamera() {
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
          myDivider(),
          menuShowcontents(),
          myDivider(),
          menuShowcamera(),
          myDivider(),
          menuShowcontact(),
          myDivider(),
          menuShowabout(),
          myDivider(),
        ],
      ),
    );
  }

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          //colors: [Colors.white,Colors.black],
          colors: [Colors.yellow[200], Colors.yellow[500]],
          radius: 1.0,
          center: Alignment.center,
        ),
      ), //พื้นหลังด้านกล่องบน
      child: Column(
        children: <Widget>[
          Container(
            width: 70.0,
            height: 70.0,
            child: Image.asset('images/logodoctorcomm.png'),
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
        
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        /*
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'ค้นหาปัญหาที่นี่'),
            onChanged: (val) {
              setState(() {});
            },
            
            // onChanged: (val) {
            //   setState(() {
            //      name = val;
            //   });
            // },
          ),
        ),
        */
        actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchProblemBar()));
        },
        child: Icon(
          Icons.search,
          size: 26.0,
        ),
      )
    ),
    ],
      ),
      body: myWidget,
      drawer: showDrawMenu(),
    );
  }
  /*
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
  */
}

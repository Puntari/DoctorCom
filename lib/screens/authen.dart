import 'package:doctor_com/screens/homemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {

//Explicit


//Method
  Widget showLogo() {
    return Image.asset(
      'images/logo.png',
      fit: BoxFit.contain,
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  Widget homenupButton() {
    return RaisedButton(
      color: Colors.amberAccent,
      child: Text(
        'Menu',
        style: TextStyle(
          fontFamily: 'AmaticSC',
          fontSize: 35.0,
        ),
      ),
      onPressed: () {
        print('You Click Home Menu');

        //Create Route
        var homemenuRoute =
            MaterialPageRoute(builder: (BuildContext context) => Homemenu());
            Navigator.of(context).push(homemenuRoute);
      },
    );
  }

  Widget showText() {
    return Text(
      'DOCTORCOM',
      style: TextStyle(
        fontSize: 80.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'AmaticSC',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.yellow, Colors.amber],
                begin: Alignment.topCenter)),
        padding: EdgeInsets.only(top: 180.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            homenupButton(),
          ],
        ),
      ),
    );
  }
}

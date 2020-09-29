import 'package:flutter/material.dart';

class ShowContact extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContact> {
  //Explicit

//Method
Widget showLogo() {
    return Image.asset(
      'images/contact.png',
      fit: BoxFit.contain,
      width: 150.0,
    );
  }

 Widget showtext() {
   return ListTile(
      leading: Icon(
        Icons.contact_phone,
        size: 50.0,
        color: Colors.grey,
      ),
      title: Text(
        '086-259-6985',
        style: TextStyle(fontSize: 14.0),
      ),
     
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showtext(),
           
          ],
        ),
      ),
    );
  }
}

    
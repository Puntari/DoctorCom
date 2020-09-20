import 'package:flutter/material.dart';

class ShowContact extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContact> {
  //Explicit

//Method

 Widget showLogo() {
   return ListTile(
      leading: Icon(
        Icons.contact_phone,
        size: 50.0,
        color: Colors.lightBlue,
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey,Colors.grey],
                begin: Alignment.topCenter)),
        padding: EdgeInsets.only(top: 180.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
           
          ],
        ),
      ),
    );
  }
}

    
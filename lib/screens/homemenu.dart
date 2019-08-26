import 'package:flutter/material.dart';

class Homemenu extends StatefulWidget {
  @override
  _HomemenuState createState() => _HomemenuState();
}

class _HomemenuState extends State<Homemenu> {
 

  //Method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Menu'),
      ),
      body:Text('body'),
    );
  }
}

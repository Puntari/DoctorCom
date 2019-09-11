import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Homemenu extends StatefulWidget {
  @override
  _HomemenuState createState() => _HomemenuState();
}

class _HomemenuState extends State<Homemenu> {
  //Explicit
  final formKey = GlobalKey<FormState>();
 
  //Method
  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  Widget teachButton() {

    return RaisedButton(
        color: Colors.yellow[300],
        child: Text('Teach'),
      onPressed: () {
        print('You Click Teach');
      },
    );
  }

  Widget scanButton() {
    return RaisedButton(
      color: Colors.green[300],
      child: Text('Scan'),
      onPressed: () {
        print('You Click Teach');
      },
    );
  }

  Widget searchButton() {
    return RaisedButton(
      color: Colors.lightBlue[300],
      child: Text('Search'),
      onPressed: () {
        print('You Click Teach');
      },
    );
  }

  Widget myButton() {
    return Container(
      width: 150.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: teachButton(),
          ),
        ],
      ),
    );
  }

  Widget myButtoni() {
    return Container(
      width: 150.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: scanButton(),
          ),
        ],
      ),
    );
  }

  Widget myButtonii() {
    return Container(
      width: 150.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: searchButton(),
          ),
        ],
      ),
    );
  }

  Widget showImage() {
    return Container(
        width: 450.0,
        height: 130.0,
        child: Image.asset(
          'images/download.png',
          fit: BoxFit.contain,
        ));
  }

  Widget showImageii() {
    return Container(
        width: 450.0,
        height: 130.0,
        child: Image.asset(
          'images/search.png',
          fit: BoxFit.contain,
        ));
  }

  Widget showImagei() {
    return Container(
        width: 450.0,
        height: 130.0,
        child: Image.asset(
          'images/scan.png',
          fit: BoxFit.contain,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          backgroundColor: Colors.yellow[900],
        ),
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange[200],
            ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 30.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  showImage(),
                  myButton(),
                  showImagei(),
                  myButtoni(),
                  showImageii(),
                  myButtonii(),
                ],
              ),
            ),
          ),
        ));
  }
}

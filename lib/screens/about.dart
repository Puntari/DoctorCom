import 'package:flutter/material.dart';

class ShowAbout extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowAbout> {

  Widget showFon() {
    return Image.asset(
      'images/fon.jpg',
      fit: BoxFit.contain,
      width: 120.0,
      height: 120.0,
    );
  }

 Widget showTextfon() {
    return Text(
      'ชื่อ นางสาว วรีพร ประทุมทอง',
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'AmaticSC',
      ),
    );
  }

 Widget showPly() {
    return Image.asset(
      'images/pai.jpg',
      fit: BoxFit.contain,
      width: 120.0,
      height: 120.0,
    );
  }

  Widget showTextply() {
    return Text(
      'ชื่อ นาย ณัฐกาญจน์ ภิญโญทรัพย์',
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'AmaticSC',
      ),
    );
  }
  Widget showFai() {
    return Image.asset(
      'images/faii.jpg',
      fit: BoxFit.contain,
      width: 120.0,
      height: 165.0,
    );
  }

    Widget showTextfai() {
    return Text(
      'ชื่อ นางสาว ปุณฑริกา สายหยุด',
      style: TextStyle(
        fontSize: 15.0,
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
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showFon(),
            showTextfon(),
            showPly(),
            showTextply(),
            showFai(),
            showTextfai()
          ],
        ),
      ),
    );
  }
}
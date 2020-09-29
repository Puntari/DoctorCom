import 'package:flutter/material.dart';

class ShowAbout extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowAbout> {

  Widget showPly() {
    return Image.asset(
      'images/search.png',
      fit: BoxFit.contain,
      width: 130.0,
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

  Widget showFon() {
    return Image.asset(
      'images/scan.png',
      fit: BoxFit.contain,
      width: 130.0,
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

  Widget showFai() {
    return Image.asset(
      'images/download.png',
      fit: BoxFit.contain,
      width: 130.0,
    );
  }

/* Widget showTextfai() {
    return Text(
      'ชื่อ นางสาว ปุณฑริกา สายหยุด',
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'AmaticSC',
      ),
    );
  }
*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showPly(),
            showTextply(),
            showFon(),
            showTextfon(),
            showFai(),
            //showTextfai()
          ],
        ),
      ),
    );
  }
}
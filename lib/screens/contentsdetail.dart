// ignore: unused_import
import 'package:doctor_com/menu/product_contentsdetail.dart';
// ignore: unused_import
import 'package:doctor_com/menu/product_detail.dart';
import 'package:doctor_com/screens/detail.dart';
import 'package:flutter/material.dart';

class ShowContentsdetail extends StatefulWidget {
 final ProductContentsdetail productContentsdetail;
 ShowContentsdetail({Key key, this.productContentsdetail}) : super(key: key); //รับค่าของmodel

  @override
  _ShowContentsdetailState createState() => _ShowContentsdetailState();
}

class _ShowContentsdetailState extends State<ShowContentsdetail> {
 // Explicit
 ProductContentsdetail productContentsdetail;
  String name = '', problem ='', solve ='', url ='';

  // Method
  @override
    void initState() {
    // TODO: implement initState
    super.initState();

 setState(() {
      productContentsdetail = widget.productContentsdetail;
      name = productContentsdetail.name;
      problem = productContentsdetail.problem;
      solve = productContentsdetail.solve; 
      url = productContentsdetail.url;
      print('name = $name');
      print('problem = $problem');
    });
  }
Widget showName() {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        productContentsdetail.name,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget showProblam(){
    return Container(
      child: Text(
        productContentsdetail.problem,
        style: TextStyle(fontSize: 20,
        
        ),
      ),
    );
  }

   Widget showText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        showProblam(),
      ],
    );
  }



  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('วิธีแก้ปัญหา'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          showName(),
          showText(),
         
          
        ],
      ),
    );
  }
}
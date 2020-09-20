// ignore: unused_import
import 'package:doctor_com/menu/product_contentsdetail.dart';
// ignore: unused_import
import 'package:doctor_com/menu/product_detail.dart';
import 'package:doctor_com/menu/product_detail.dart' as prefix0;
import 'package:flutter/material.dart';

class ShowContentsdetail extends StatefulWidget {
 final prefix0.ProductContentsdetail productContentsdetail;
 ShowContentsdetail({Key key, this.productContentsdetail}) : super(key: key); //รับค่าของmodel

  @override
  _ShowContentsdetailState createState() => _ShowContentsdetailState();
}

class _ShowContentsdetailState extends State<ShowContentsdetail> {
 // Explicit
 prefix0.ProductContentsdetail productContentsdetail;
  String name = '', detail = '';

  // Method
  @override
    void initState() {
    // TODO: implement initState
    super.initState();

 setState(() {
      productContentsdetail = widget.productContentsdetail;
      name = productContentsdetail.name;
      detail = productContentsdetail.detail;
      print('name = $name');
    });
  }
Widget showName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        productContentsdetail.name,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.purple,
        ),
      ),
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
         
          
        ],
      ),
    );
  }
}
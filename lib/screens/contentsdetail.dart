import 'package:doctor_com/menu/product_contentsdetail.dart';
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
  String name = '', url = '';

  // Method
  @override
    void initState() {
    // TODO: implement initState
    super.initState();

 setState(() {
      productContentsdetail = widget.productContentsdetail;
      name = productContentsdetail.name;
      url = productContentsdetail.url;
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
        title: Text('สอนลงระบบปฎิบัติการ'),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  
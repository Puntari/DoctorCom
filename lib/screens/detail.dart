import 'package:Doctorcom/menu/product_menu.dart';
import 'package:flutter/material.dart';

class ShowDetail extends StatefulWidget {
  final ProductMenu productMenu;
 ShowDetail({Key key, this.productMenu}) : super(key: key); //รับค่าของmodel

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
 // Explicit
  ProductMenu productMenu;
  String name = '', url = '';

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      productMenu = widget.productMenu;
      name = productMenu.name;
      url = productMenu.url;
      print('name = $name');
    });
  }

  Widget showName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        productMenu.name,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
      height: 170,
      child: Image.network(
        productMenu.url,
        fit: BoxFit.contain,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('สอนลงระบบปฎิบัติการ'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          showName(),
          showImage(),
          
        ],
      ),
    );
  }
}
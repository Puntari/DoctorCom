import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_com/menu/product_menu.dart';
import 'package:flutter/material.dart';

class ShowMenu extends StatefulWidget {
  @override
  _ShowMenuState createState() => _ShowMenuState();
}

class _ShowMenuState extends State<ShowMenu> {
  //Explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<ProductMenu> productMenus = [];

  //Method

  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection('home');
    subscription = await collectionReference.snapshots().listen((dataSnapshop) {
      snapshots = dataSnapshop.documents;

      for (var snapshot in snapshots) {
        String name = snapshot.data['Name'];
        print('name ==> $name');

        String url = snapshot.data['Url'];

        ProductMenu productMenu = ProductMenu(name, url);

        setState(() {
          productMenus.add(productMenu);
        });
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30.0)),
      width: 250.0,
      height: 200.0,
      child: Image.network(
        productMenus[index].url,
        fit: BoxFit.contain,
      ),
    );
  }

   Widget Showtext(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        showName(index)],
    );
  }

  Widget showName(int index) {
    return Text(
      productMenus[index].name,
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget showListMenu() {
    return Container(
      child: ListView.builder(
        itemCount: productMenus.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                showImage(index),
                SizedBox(
                  width: 8.0,
                ),
               // Showtext(index),
              ],
            ),
            onTap: () {
              print('you click index = $index');

              ///click ที่รูปแล้วไปอีกหน้า
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showListMenu(),
    );
  }
}

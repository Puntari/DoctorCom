import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, DocumentSnapshot, Firestore, QuerySnapshot;
import 'package:Doctorcom/menu/product_menu.dart';
import 'package:Doctorcom/screens/detail.dart';
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
    CollectionReference collectionReference = fireStore.collection('teach');
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
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0.0, color: Colors.transparent),
          borderRadius: BorderRadius.circular(30.0)),
      width: 250.0,
      height: 200.0,
      child: Image.network(
        productMenus[index].url,
        fit: BoxFit.contain,
      ),
    );
  }

  /* Widget showtext(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        showName(index)],
    );
  }
*/
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
            child: Card(
              margin: EdgeInsets.all(16),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  showImage(index),

                  SizedBox(
                    width: 8.0,
                  ),
                  //showtext(index),
                ],
              ),
            ),
            onTap: () {
              print('you click index = $index');
              var showDetailRoute = MaterialPageRoute(
                  builder: (BuildContext context) => ShowDetail(
                        productMenu: productMenus[index],
                      ));
              Navigator.of(context).push(showDetailRoute);

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

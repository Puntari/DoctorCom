/*import 'package:flutter/material.dart';

class ShowContents extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('สารบัญ'),
    );
  }
}*/


import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_com/menu/product_contentsdetail.dart';
import 'package:doctor_com/screens/contentsdetail.dart';
import 'package:flutter/material.dart';

class ShowContents extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContents> {
 //Explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<ProductContentsdetail> productContentsdetail = [];

  //Method

  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection('contents');
    subscription = await collectionReference.snapshots().listen((dataSnapshop) {
      snapshots = dataSnapshop.documents;

      for (var snapshot in snapshots) {
        String name = snapshot.data['Name'];
        print('name ==> $name');

        String url = snapshot.data['Url'];

        ProductContentsdetail productContentsdetail = ProductContentsdetail(name, url);

        setState(() {
          productContentsdetail.add(productContentsdetail);
        });
      }
    });
  }

  Widget ShowText(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        showName(index)],
    );
  }

  Widget showName(int index) {
    return Text(
      productContentsdetail[index].name,
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget showListMenucontents() {
    return Container(
      child: ListView.builder(
        itemCount: productContentsdetail.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ShowText(index),
                SizedBox(
                  width: 8.0,
                ),
                
              ],
            ),
            onTap: () {
              print('you click index = $index');
              var showContentsdetailRoute = MaterialPageRoute(
                  builder: (BuildContext context) => ShowContentsdetail(
                        productContentsdetail: productContentsdetail[index],
                      ));
                            Navigator.of(context).push(showContentsdetailRoute);


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
      child: showListMenucontents(),
    );
  }
}



import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:doctor_com/menu/product_contentsdetail.dart';
// ignore: unused_import
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

        String problem = snapshot.data['Problem'];
        print('problem ==> $problem');

        String solve = snapshot.data['Solve'];
        print('solve = $solve');
        
        String url = snapshot.data['Url']; 

        ProductContentsdetail productContentsdetail =
        ProductContentsdetail(name, problem, solve, url);

        setState(() {
          productContentsdetail.add(productContentsdetail);
        });
      }
    });
  }

   Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30.0)),
      width: 150.0,
      height: 100.0,
      child: Image.network(
        productContentsdetail[index].url,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showName(int index) {
    return Text(
      productContentsdetail[index].name,
      style: TextStyle(fontSize: 24.0,),
    );
  }
 
  Widget showText(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        showName(index),
      ],
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
                showImage(index),
                SizedBox(
                  width: 8.0,
                ),
                showText(index),
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
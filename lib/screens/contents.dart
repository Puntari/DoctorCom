import 'dart:async';
import 'package:Doctorcom/settingKorgPly/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:Doctorcom/menu/product_contentsdetail.dart';
// ignore: unused_import
import 'package:Doctorcom/screens/contentsdetail.dart';
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
  List<ProductContentsdetail> productContentsdetails = [];

  //Method

  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection("contents");
    subscription = await collectionReference.snapshots().listen((dataSnapshop) {
      snapshots = dataSnapshop.documents;

      for (var snapshot in snapshots) {
        print('snapshot = $snapshot');

        String name = snapshot.data['Name'];
        print('name = $name');

        String problem = snapshot.data['Problem'];
        String solve = snapshot.data['Solve'];
        String url = snapshot.data['Url'];

        ProductContentsdetail productContentsdetail =
            ProductContentsdetail(name, problem, solve, url);

        setState(() {
          productContentsdetails.add(productContentsdetail);
        });
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding*0.0),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0.0,color: Colors.transparent), borderRadius: BorderRadius.circular(30.0)),
      width: 120.0,
      height: 100.0,
      child: Image.network(
        productContentsdetails[index].url,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showName(int index) {
    return Container(

      width: 220,
      child: Text(
        productContentsdetails[index].name,
        style: TextStyle(fontSize: 18.0),
      ),
    );

    /*Text(
      productContentsdetails[index].name,
      style: TextStyle(fontSize: 16.0,),
    );*/
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
        itemCount: productContentsdetails.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              // decoration: index % 2 == 0
              //     ? BoxDecoration(color: Colors.yellow[50])
              //     : BoxDecoration(color: Colors.yellow[200]),
              child: Card(
                margin: EdgeInsets.all(5),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    showImage(index),
                    SizedBox(
                      width: 5.0,
                    ),
                    showText(index),
                  ],
                ),
              ),
            ),
            onTap: () {
              print('you click index = $index');
              var showContentsdetailRoute = MaterialPageRoute(
                  builder: (BuildContext context) => ShowContentsdetail(
                        productContentsdetail: productContentsdetails[index],
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

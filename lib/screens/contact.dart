import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_com/menu/product_contact.dart';
import 'package:flutter/material.dart';

class ShowContact extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContact> {
//Explicit
Firestore firestore = Firestore.instance;
StreamSubscription<QuerySnapshot> subscription;
List<DocumentSnapshot> snapshots;
List<ProductContact> productContacts =[];

  get index => null;


//Method
@override
void initState() { 
  super.initState();
  readFireStore();
}


Future<void> readFireStore() async {
  CollectionReference collectionReference = firestore.collection("contact");
  subscription = await collectionReference.snapshots().listen((dataSnapshop) {
    snapshots = dataSnapshop.documents;

    for (var snapshot in snapshots){
      print('snapshot = $snapshot');

    String name = snapshot.data['Name'];
    print('name = $name');

    String tel = snapshot.data['Tel'];

    ProductContact productContact = ProductContact(name, tel);

    setState(() {
      productContacts.add(productContact);
    });
    }
   });
}

Widget showName(){
  return Container(
    width: 200,
    child: Text(
    productContacts[index].name,
    style: TextStyle(fontSize: 18.0),
  ),
  );
}

Widget showListMenucontacts() {
    return Container(
      child: ListView.builder(
        itemCount: productContacts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                showName(),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
            ),
          );
        },
      ),
    );
  }
    
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showListMenucontacts(),
    );
   
  }
}

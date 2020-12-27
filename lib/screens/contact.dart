import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, DocumentSnapshot, Firestore, QuerySnapshot;
import 'package:Doctorcom/menu/product_contact.dart';
import 'package:flutter/material.dart';

class ShowContact extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContact> {
//Explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<ProductContact> productContacts = [];

  //Method

  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = fireStore.collection("contact");
    subscription = await collectionReference.snapshots().listen((dataSnapshop) {
      snapshots = dataSnapshop.documents;

      for (var snapshot in snapshots) {
        print('snapshot = $snapshot');

        String name = snapshot.data['Name'];
        print('name = $name');

        String tel = snapshot.data['Tel'];
        String image = snapshot.data['Image'];

        ProductContact productContact = ProductContact(name, tel, image);

        setState(() {
          productContacts.add(productContact);
        });
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 120.0,
      height: 100.0,
      child: Image.network(
        productContacts[index].image,
      ),
    );
  }

  Widget showName(int index) {
    return Container(
      width: 110,
      child: Text(
        productContacts[index].name,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      // width: 200,
      /* child: Text(
      productContacts[index].tel,
      style: TextStyle(fontSize: 18.0, color: Colors.grey),
      
      ),*/

      child: SelectableText(
        productContacts[index].tel,
        style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
      ),
    );
  }

  Widget showListMenucontacts() {

    return Container(
      child: ListView.builder(
        itemCount: productContacts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              margin: EdgeInsets.all(16),
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showImage(index),
                    Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        showName(index),
                        showText(index),
                      ],
                    ),
                  ),





                    
                    
                    
                    SizedBox(
                      width: 0.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    
    /*
    return Container(
      child: ListView.builder(
        itemCount: productContacts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                showImage(index),
                showName(index),
                showText(index),
                SizedBox(
                  width: 5.0,
                ),
              ],
            ),
          );
        },
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showListMenucontacts(),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text("O R D E R S",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: StreamBuilder<QuerySnapshot>(
            // <2> Pass `Stream<QuerySnapshot>` to stream
            stream: FirebaseFirestore.instance
                .collection('orders')
                .orderBy("timestamp", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.docs.length == 0) {
                  return Center(child: Text("No posts at the moment"));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print(snapshot.data.docs[index].data());
                      // return postThread(
                      //   title: snapshot.data.docs[index].data()["Title"],
                      //   description:
                      //       snapshot.data.docs[index].data()["Description"],
                      // );
                      return orderThread(
                        status: snapshot.data.docs[index].data()["status"],
                        orderPrice:
                            snapshot.data.docs[index].data()["orderPrice"],
                        itemsInfo:
                            snapshot.data.docs[index].data()["itemsInfo"],
                      );
                    },
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget orderThread({String status, String orderPrice, List itemsInfo}) {
    return Container(
        child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.notification_important),
          title: Text(itemsInfo[0]),
          subtitle: Text(orderPrice),
          trailing: Text(status),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Divider(),
        ),
      ],
    ));
  }
}

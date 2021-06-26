import 'package:aewebshop/screens/widget/nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
            child: Container(
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
                        return ListView.separated(
                          separatorBuilder: (_, __) => Divider(
                            color: Colors.grey[400],
                            height: 5,
                            indent: 10.0,
                            thickness: 0.5,
                          ),
                          itemCount: snapshot.data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            print(snapshot.data.docs[index].data());
                            // return postThread(
                            //   title: snapshot.data.docs[index].data()["Title"],
                            //   description:
                            //       snapshot.data.docs[index].data()["Description"],
                            // );
                            return orderThread(snapshot.data.docs[index].data(),
                                index, context);
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
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: NavBar(
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }

  Widget setupAlertDialoadContainer(List items) {
    return items != null
        ? Container(
            height: 500.0, // Change as per your requirement
            width: Get.width * 0.7, // Change as per your requirement
            child: ListView.separated(
              separatorBuilder: (_, __) => Divider(
                color: Colors.grey[400],
                height: 5,
                indent: 10.0,
                thickness: 0.5,
              ),
              shrinkWrap: true,
              itemCount: items?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(items[index]["image"]),
                  subtitle: Text(
                    ("price " + items[index]["price"].toString() ?? "price") +
                        " x " +
                        ("quantity " + items[index]["quantity"].toString() ??
                            "quantity") +
                        " = " +
                        ("total cost " + items[index]["cost"].toString() ??
                            "cost"),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  title: Text(items[index]["name"],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                );
              },
            ),
          )
        : Center(child: Text("No Items"));
  }

  Widget orderThread(Map<String, dynamic> data, int index, context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Items Info',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    content: setupAlertDialoadContainer(data["itemsInfo"]),
                  );
                });
          },
          leading: CircleAvatar(
            radius: 20,
            child: Text(index.toString()),
          ),
          title: Text(data["name"],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          subtitle: Text(data["orderPrice"],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          trailing: Text(data["status"],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Divider(),
        ),
      ],
    ));
  }
}

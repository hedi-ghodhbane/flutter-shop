import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/screens/preartiki.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController _userController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        textStyle: MaterialStateProperty.resolveWith(
            (states) => TextStyle(color: Colors.black)),
        padding:
            MaterialStateProperty.resolveWith((states) => EdgeInsets.all(20)),
        backgroundColor:
            MaterialStateProperty.resolveWith<Color>((states) => Colors.white));
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      Container(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Image.asset(
            'assets/img/ae_landing.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            new Image.asset('assets/img/aelogo.png', height: 180, width: 180),
            SizedBox(height: 50),
            Text(
              "WEB SHOP",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Na stanju preko 30.000 autodijelova za razne automobile.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red[800])),
                elevation: 5.0,
                color: Colors.red[800],
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                splashColor: Colors.grey,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PregledArtikala()));
                },
                child: Text("Pretraga autodijelova"))
          ],
        ),
      ),
      Positioned(
          top: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonBar(
              buttonPadding: EdgeInsets.all(0),
              overflowButtonSpacing: 0,
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: buttonStyle.copyWith(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)))),
                    ),
                    onPressed: null,
                    child: Row(
                      children: [
                        Icon(Icons.account_box),
                        Text(
                          "Ilhan kjkj",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    )),
                TextButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                        ),
                        Text("Cart",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    )),
                TextButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("Orders",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    )),
                TextButton(
                    style: buttonStyle.copyWith(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.redAccent),
                        textStyle: MaterialStateProperty.resolveWith((states) =>
                            TextStyle(fontSize: 20, color: Colors.white))),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        Text("Logout",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    )),
              ],
            ),
          )
          //  Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         // Navigator.push(context,
          //         //     MaterialPageRoute(builder: (context) => LoginScreen()));
          //         _userController.signOut();
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Colors.amber,
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //         margin:
          //             EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          //         padding:
          //             EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          //         child: Text(
          //           // _auth.isLogged ? _auth.userEmail : "Login",
          //           "Log Out",
          //           style: TextStyle(
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Colors.amber,
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          //       child: Obx(
          //         () => Text(
          //           // _auth.isLogged ? _auth.userEmail : "Login",
          //           _userController.userData.value.name ?? "",
          //           style: TextStyle(
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ))
          // ],
          ),
    ]));
  }
}

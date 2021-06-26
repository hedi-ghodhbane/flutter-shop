import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'
    as mIcons;

import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/screens/auth/login_screen.dart';
import 'package:aewebshop/screens/orders.dart';
import 'package:aewebshop/screens/shopping_cart.dart';

class NavBar extends StatelessWidget {
  final UserController _userController = Get.find();
  final Color color;
  NavBar({
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    print(_userController?.userData?.value?.name);
    final buttonStyle = ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        textStyle: MaterialStateProperty.resolveWith(
            (states) => TextStyle(color: Colors.black)),
        padding:
            MaterialStateProperty.resolveWith((states) => EdgeInsets.all(20)),
        backgroundColor:
            MaterialStateProperty.resolveWith<Color>((states) => this.color));
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(5.0),
        child: ButtonBar(
          buttonPadding: EdgeInsets.all(0),
          overflowButtonSpacing: 0,
          alignment: MainAxisAlignment.center,
          children: [
            if (_userController?.userData?.value?.name != null)
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
                      Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _userController.userData.value.name ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ],
                  )),
            TextButton(
                style: buttonStyle.copyWith(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              _userController.userData.value.name == null
                                  ? 10
                                  : 0),
                          bottomLeft: Radius.circular(
                              _userController.userData.value.name == null
                                  ? 10
                                  : 0)))),
                ),
                onPressed: () {
                  Get.to(ShoppingCartWidget());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cart",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ],
                )),
            TextButton(
                style: buttonStyle,
                onPressed: () {
                  Get.to(UserOrder());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Orders",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ],
                )),
            TextButton(
                style: buttonStyle.copyWith(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10)))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => _userController.userData.value.name != null
                            ? Colors.red[800]
                            : Colors.green[800]),
                    textStyle: MaterialStateProperty.resolveWith((states) =>
                        TextStyle(fontSize: 20, color: Colors.white))),
                onPressed: () {
                  if (_userController.userData.value.name != null) {
                    _userController.signOut();
                  } else {
                    Get.to(LoginScreen());
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      _userController.userData.value.name != null
                          ? mIcons.MdiIcons.exitToApp
                          : mIcons.MdiIcons.login,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                        _userController.userData.value.name != null
                            ? "Logout"
                            : "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

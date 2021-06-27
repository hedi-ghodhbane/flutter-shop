import 'package:aewebshop/constants/sizes.dart';
import 'package:aewebshop/screens/homepage.dart';
import 'package:aewebshop/screens/preartiki.dart';
import 'package:aewebshop/screens/widget/auth_wrapper.dart';
import 'package:aewebshop/screens/widget/login_container.dart';
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
  final Sizes size;
  final Color color;
  final bool roundLoginButton;
  NavBar({
    this.size = Sizes.Large,
    this.roundLoginButton = false,
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
    return size == Sizes.Large
        ? forLargeScreen(buttonStyle)
        : forSmallScreen(buttonStyle);
  }

  Drawer forSmallScreen(buttonStyle) {
    return Drawer(
      child: Container(
        color: Colors.white,
        width: Get.width * 0.5,
        height: Get.height,
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red[800],
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Welcome " + (_userController?.userData?.value?.name ?? ""),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            )),
            Container(
              height: Get.height * 0.5,
              alignment: Alignment.centerLeft,
              child: ListView(
                children: [
                  homeButton(buttonStyle),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 0.5,
                    color: Colors.grey[200],
                  ),
                  shopButtons(buttonStyle),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 0.5,
                    color: Colors.grey[200],
                  ),
                  ordersbutton(buttonStyle),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 0.5,
                    color: Colors.grey[200],
                  ),
                  myCartButton(buttonStyle),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    thickness: 0.5,
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  logoutButton(buttonStyle, radius: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget forLargeScreen(ButtonStyle buttonStyle) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: buildButtonBar(buttonStyle,
          userName: _userController.userData.value.name),
    );
  }

  ButtonBar buildButtonBar(ButtonStyle buttonStyle,
      {String userName, bool isRow = true}) {
    return ButtonBar(
      mainAxisSize: MainAxisSize.max,
      buttonPadding: EdgeInsets.all(0),
      overflowButtonSpacing: 0,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      alignment: MainAxisAlignment.center,
      children: [
        if (userName != null) showUserButton(buttonStyle, userName: userName),
        homeButton(buttonStyle),
        shopButtons(buttonStyle),
        myCartButton(buttonStyle),
        ordersbutton(buttonStyle),
        logoutButton(buttonStyle),
      ],
    );
  }

  TextButton showUserButton(ButtonStyle buttonStyle, {String userName}) {
    return TextButton.icon(
      style: buttonStyle.copyWith(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10)))),
      ),
      icon: Icon(Icons.person_outline),
      onPressed: null,
      label: Text(
        userName ?? "",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
    );
  }

  TextButton myCartButton(ButtonStyle buttonStyle) {
    return TextButton.icon(
      style: buttonStyle,
      onPressed: () {
        Get.to(ShoppingCartWidget());
      },
      icon: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
      ),
      label: Text("Cart", style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }

  TextButton homeButton(ButtonStyle buttonStyle) {
    return TextButton.icon(
      style: buttonStyle.copyWith(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    _userController.userData.value.name == null ? 10 : 0),
                bottomLeft: Radius.circular(
                    _userController.userData.value.name == null ? 10 : 0)))),
      ),
      onPressed: () {
        Get.to(HomePage());
      },
      icon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      label: Text("Home", style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }

  TextButton shopButtons(ButtonStyle buttonStyle) {
    return TextButton.icon(
      style: buttonStyle,
      onPressed: () {
        Get.to(PregledArtikala());
      },
      icon: Icon(
        mIcons.MdiIcons.shopping,
        color: Colors.black,
      ),
      label: Text("Pretraga autodijelova",
          style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }

  TextButton ordersbutton(ButtonStyle buttonStyle) {
    return TextButton.icon(
      style: buttonStyle,
      onPressed: () {
        Get.to(UserOrder());
      },
      icon: Icon(
        Icons.list_alt_outlined,
        color: Colors.black,
      ),
      label:
          Text("Orders", style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }

  TextButton logoutButton(ButtonStyle buttonStyle, {bool radius = true}) {
    return TextButton.icon(
      style: buttonStyle.copyWith(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(radius ? 10 : 0),
                  bottomLeft: Radius.circular(roundLoginButton ? 10 : 0),
                  topLeft: Radius.circular(roundLoginButton ? 10 : 0),
                  topRight: Radius.circular(radius ? 10 : 0)))),
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              _userController.userData.value.name != null
                  ? Colors.red[800]
                  : Colors.amber[600]),
          textStyle: MaterialStateProperty.resolveWith(
              (states) => TextStyle(fontSize: 20, color: Colors.white))),
      onPressed: () {
        if (_userController.userData.value.name != null) {
          _userController.signOut();
        } else {
          Get.defaultDialog(
              titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              title: "Authentification",
              content: AuthWrapper(),
              barrierDismissible: true);
        }
      },
      icon: Icon(
        _userController.userData.value.name != null
            ? mIcons.MdiIcons.exitToApp
            : mIcons.MdiIcons.login,
        color: Colors.white,
      ),
      label: Text(
          _userController.userData.value.name != null ? "Logout" : "Login",
          style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}

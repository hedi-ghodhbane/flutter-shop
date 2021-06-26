import 'package:aewebshop/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignupContainer extends StatefulWidget {
  String type;

  SignupContainer({this.type});

  @override
  _SignupContainerState createState() => _SignupContainerState();
}

class _SignupContainerState extends State<SignupContainer> {
  UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      height: Get.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userController.fullnameTextEditingController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Fullname',
                labelText: 'Fullname',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[800], width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 0.5),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userController.emailTextEditingController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[800], width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 0.5),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userController.passwordTextEditingController,
              obscureText: true,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.red[800]),
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[800], width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red[800], width: 0.5),
                ),
                hintStyle: TextStyle(color: Colors.red[800]),
                labelStyle: TextStyle(color: Colors.red[800]),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 45.0,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  _userController.signUp();
                },
                color: Colors.red[800],
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

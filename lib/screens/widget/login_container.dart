import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginContainer extends StatefulWidget {
  String type;

  LoginContainer({this.type});

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userController.emailTextEditingController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.red[800]),
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
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
          // Text(
          //   'I forgot my password?',
          //   style: TextStyle(color: Colors.yellow[800], fontSize: 16.0),
          // ),
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
                  _userController.emailAndPasswordSignIn();
                },
                color: Colors.red[800],
                child: Text(
                  'Login',
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

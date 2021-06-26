import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/screens/auth/signup_screen.dart';
import 'package:aewebshop/screens/widget/login_container.dart';
import 'package:aewebshop/screens/widget/signup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AuthWrapper extends StatefulWidget {
  String type;

  AuthWrapper({this.type});

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  UserController _userController = Get.find();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: Get.width * 0.5,
        height: Get.height * 0.5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: IndexedStack(
                  index: _index,
                  children: [LoginContainer(), SignupContainer()],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 45.0,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _index = _index == 0 ? 1 : 0;
                      });
                    },
                    color: Colors.amber[600],
                    child: Text(
                      _index == 0 ? 'Create New Account' : 'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

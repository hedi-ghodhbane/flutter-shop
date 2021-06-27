import 'package:aewebshop/constants/sizes.dart';
import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/screens/auth/signup_screen.dart';
import 'package:aewebshop/screens/widget/login_container.dart';
import 'package:aewebshop/screens/widget/signup_container.dart';
import 'package:bot_toast/bot_toast.dart';
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
    final width = MediaQuery.of(context).size.width;
    final size = WindowSizes.size(width);
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size == Sizes.Large ? Get.width * 0.5 : Get.width * 0.8,
              height: size == Sizes.Large ? Get.height * 0.5 : Get.height * 0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: IndexedStack(
                        index: _index,
                        children: [LoginContainer(), SignupContainer()],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 45.0,
                        width: size == Sizes.Large
                            ? Get.width * 0.3
                            : Get.width * 0.6,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            _userController.clearControllers();
                            setState(() {
                              _index = _index == 0 ? 1 : 0;
                            });
                          },
                          color: Colors.amber[600],
                          child: Text(
                            _index == 0 ? 'Create New Account' : 'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                  onTap: () {
                    BotToast.cleanAll();
                  },
                  child: Icon(
                    Icons.close_rounded,
                    size: WindowSizes.size(Get.width) == Sizes.Large ? 50 : 30,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

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
    final EdgeInsets _defaultPadding = EdgeInsets.symmetric(
        horizontal: (widget.type == 'desktop')
            ? 110.0
            : (widget.type == 'tablet')
                ? 50.0
                : 20.0);

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        margin: EdgeInsets.symmetric(vertical: 50.0),
        width: (widget.type == 'desktop')
            ? MediaQuery.of(context).size.width * 0.5
            : (widget.type == 'tablet')
                ? MediaQuery.of(context).size.width * 0.7
                : MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Color.fromRGBO(71, 9, 110, 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
                offset: Offset(0.0, 0.0),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: _defaultPadding,
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Login with facebook'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.snackbar(
                                  "Error!", "Feature not available yet");
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(71, 9, 110, 1),
                                  width: 5.0,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                padding: EdgeInsets.all(0.5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    shape: BoxShape.circle),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(71, 9, 110, 1),
                                  child: Icon(
                                    MdiIcons.facebook,
                                    size: 42.0,
                                    color: Color.fromRGBO(75, 110, 169, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.snackbar(
                                  "Error!", "Feature not available yet");
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              margin: EdgeInsets.only(left: 80.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(71, 9, 110, 1),
                                  width: 5.0,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                padding: EdgeInsets.all(0.5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    shape: BoxShape.circle),
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(71, 9, 110, 1),
                                  child: Icon(
                                    MdiIcons.twitter,
                                    size: 42.0,
                                    color: Color.fromRGBO(101, 187, 242, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Login with twitter'.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: _defaultPadding,
              child: TextFormField(
                controller: _userController.fullnameTextEditingController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Fullname',
                  labelText: 'Fullname',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellow[800], width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: _defaultPadding,
              child: TextFormField(
                controller: _userController.emailTextEditingController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellow[800], width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: _defaultPadding,
              child: TextFormField(
                controller: _userController.passwordTextEditingController,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.yellow[800], width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
           
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: _defaultPadding,
              child: Container(
                width: double.infinity,
                height: 45.0,
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    _userController.signUp();
                  },
                  color: Colors.green,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.yellow[800],
              thickness: 0.5,
            ),
            
          ],
        ),
      ),
    );
  }
}

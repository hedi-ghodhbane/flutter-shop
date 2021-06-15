import 'package:aewebshop/model/user.dart';
import 'package:aewebshop/utilities/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rx<User> firebaseUser;
  Rx<UserData> userData = UserData().obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var userCollection = FirebaseFirestore.instance.collection("users");
  final box = GetStorage();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    userData.bindStream(userDataStream());
    // ever(firebaseUser, setInitialScreen);
  }

  get getuser => userData.bindStream(userDataStream());

  addDataToDb({String email, String password, String uid}) {
    try {
      //showLoading();
      String username = Utils.getUsername(email);
      userCollection.doc(uid).set({
        "username": username,
        "email": email,
        "password": password,
        "uid": uid,
        "cart": [],
      }).then((value) {
        print("====================== stream");
        userData.bindStream(userDataStream());
      });

      //dismissLoading();
    } catch (e) {
      //dismissLoading();
      print(e);
    }
  }

  void signIn({email, password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) {
        var user = result.user;
        box.write("uid", user.uid);
        userData.bindStream(userDataStream());
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  signOut() {
    auth.signOut();
  }

  // updateUserData(Map<String, dynamic> data) {
  //   var uid = box.read("uid");
  //   print(uid);
  //   print(uid);
  //   //logger.i("UPDATED");
  //   userCollection.doc(uid).update(data);
  // }
  updateUserData(Map<String, dynamic> data) {
    
    userCollection.doc(box.read("uid")).update(data);
  }

  Stream<UserData> userDataStream() => userCollection
      .doc(box.read('uid'))
      .snapshots()
      .map((snapshot) => UserData.fromSnapshot(snapshot));
}

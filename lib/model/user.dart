import 'package:aewebshop/model/cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PASSWORD = "password";
  static const CART = "cart";
  

  String uid;
  String name;
  String email;
  String password;
  List<CartItemModel> cart;
  

  UserData({
    this.uid,
    this.name,
    this.email,
    this.password,
    
  });

  UserData.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.get(NAME);
    email = snapshot.get(EMAIL);
    uid = snapshot.get(ID);
    password = snapshot.get(PASSWORD);
    cart = _convertCartItems(snapshot.get(CART) ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    if(cartFomDb.length > 0){
      cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });
    }
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}

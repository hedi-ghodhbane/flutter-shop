import 'package:aewebshop/controllers/cart_controller.dart';
import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/screens/widget/cart_item_widget.dart';
import 'package:aewebshop/widgets/custom_btn.dart';
import 'package:aewebshop/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartWidget extends StatelessWidget {
  final CartController cartController = Get.find();
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: userController.userData.value.cart
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ),)
                      .toList(),
                )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Obx(
                  () => CustomButton(
                      text:
                          "Order (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                      onTap: () {
                        //paymentsController.createPaymentMethod();
                      }),
                )))
      ],
    );
  }
}

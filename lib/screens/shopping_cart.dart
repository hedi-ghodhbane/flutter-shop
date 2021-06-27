import 'dart:convert';

import 'package:aewebshop/constants/sizes.dart';
import 'package:aewebshop/controllers/cart_controller.dart';
import 'package:aewebshop/controllers/order_controller.dart';
import 'package:aewebshop/controllers/user_controller.dart';
import 'package:aewebshop/model/cart_item.dart';
import 'package:aewebshop/screens/widget/cart_item_widget.dart';
import 'package:aewebshop/utilities/loading.dart';
import 'package:aewebshop/widgets/custom_btn.dart';
import 'package:aewebshop/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartWidget extends StatelessWidget {
  final CartController cartController = Get.find();
  final UserController userController = Get.find();
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final screenSize = WindowSizes.size(width);
    return Stack(
      children: [
        ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: CustomText(
                  size: screenSize == Sizes.Large ? 20 : 12,
                  text: "Shopping Cart",
                  weight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction:
                    screenSize == Sizes.Large ? Axis.horizontal : Axis.vertical,
                children: [
                  Obx(
                    () => Container(
                      width: screenSize == Sizes.Large
                          ? Get.width * 0.6
                          : Get.width,
                      child: DataTable(
                        dataRowHeight: screenSize == Sizes.Large ? 100 : 50,
                        sortAscending: false,
                        columnSpacing: screenSize == Sizes.Large ? 30 : 6,
                        columns: [
                          DataColumn(
                              label: Center(
                            child: Text("Prouct",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize:
                                        screenSize == Sizes.Large ? 20 : 10)),
                          )),
                          DataColumn(
                              label: Center(
                            child: Text("Unit price",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize:
                                        screenSize == Sizes.Large ? 20 : 10)),
                          )),
                          DataColumn(
                              label: Center(
                            child: Text("Final Price",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize:
                                        screenSize == Sizes.Large ? 20 : 10)),
                          )),
                          DataColumn(
                              label: Center(
                            child: Text("Remove",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize:
                                        screenSize == Sizes.Large ? 20 : 10)),
                          )),
                        ],
                        rows: userController.userData.value.cart
                            .map(
                              (cartItem) => DataRow(cells: <DataCell>[
                                DataCell(Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Image.network(
                                          cartItem?.image ?? "",
                                          fit: BoxFit.fill,
                                          height: screenSize == Sizes.Large
                                              ? 100
                                              : 50,
                                          width: screenSize == Sizes.Large
                                              ? 100
                                              : 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: screenSize == Sizes.Large
                                            ? 100
                                            : 50,
                                        padding: EdgeInsets.only(
                                            left: screenSize == Sizes.Large
                                                ? 14
                                                : 0),
                                        child: CustomText(
                                          size: screenSize == Sizes.Large
                                              ? 20
                                              : 10,
                                          text: cartItem.name,
                                        )),
                                  ],
                                )),
                                DataCell(
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: screenSize == Sizes.Large
                                              ? 14
                                              : 0),
                                      child: CustomText(
                                        size:
                                            screenSize == Sizes.Large ? 20 : 12,
                                        text: cartItem.price.toString(),
                                      )),
                                ),
                                DataCell(
                                  Padding(
                                    padding: EdgeInsets.all(
                                        screenSize == Sizes.Large ? 14 : 0),
                                    child: CustomText(
                                      size: screenSize == Sizes.Large ? 20 : 12,
                                      text: "\$${cartItem.cost}",
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.remove,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          cartController
                                              .removeCartItem(cartItem);
                                        }),
                                  ),
                                ),
                              ]),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize == Sizes.Large ? 0 : Get.height * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: screenSize == Sizes.Large ? 500 : 200,
                      width: screenSize == Sizes.Large ? 300 : Get.width,
                      color: Colors.grey.withOpacity(0.9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            size: screenSize == Sizes.Large ? 20 : 12,
                            text: "Summary",
                            weight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                size: screenSize == Sizes.Large ? 20 : 12,
                                text: "Total Price",
                              ),
                              Obx(
                                () => CustomText(
                                  size: screenSize == Sizes.Large ? 20 : 12,
                                  text:
                                      " (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                                  weight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(8.0),
                              child: Obx(
                                () => CustomButton(
                                    text:
                                        "Order (\$${cartController?.totalCartPrice?.value?.toStringAsFixed(2) ?? ""})",
                                    onTap: () {
                                      // convert each item to a string by using JSON encoding
                                      final jsonList = userController
                                          .userData.value.cart
                                          .map((item) => jsonEncode(item))
                                          .toList();

                                      // using toSet - toList strategy
                                      final uniqueJsonList =
                                          jsonList.toSet().toList();

                                      // convert each item back to the original form using JSON decoding
                                      final myOrders = uniqueJsonList
                                          .map((item) => jsonDecode(item))
                                          .toList();
                                      print(myOrders);

                                      orderController.createOrder(
                                        itemInfo: myOrders,
                                        orderPrice: cartController
                                            .totalCartPrice.value
                                            .toStringAsFixed(2),
                                      );

                                      //paymentsController.createPaymentMethod();
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 5,
            left: 5,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                size: 50,
              ),
            ))
      ],
    );
  }
}

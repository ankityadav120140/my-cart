// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../contollers/cart_controller.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart"),
        elevation: 1.h,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 7.w, top: 1.h),
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Subtotal Amount \$ ",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Text(
                    cartController.totalPrice.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final product =
                        cartController.cartItems.keys.elementAt(index);
                    final quantity = cartController.cartItems[product] ?? 0;
                    return CartItem(
                      product,
                      quantity,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

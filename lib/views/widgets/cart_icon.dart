// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cart/contollers/cart_controller.dart';
import 'package:my_cart/views/pages/cart_page.dart';
import 'package:sizer/sizer.dart';

Widget CartIcon() {
  final CartController cartController = Get.find();
  return InkWell(
    onTap: () {
      Get.to(CartPage());
    },
    child: Stack(
      children: [
        Icon(
          Icons.shopping_cart,
          size: 40.sp,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            radius: 3.w,
            backgroundColor: Colors.amber,
            child: Text(
              cartController.totalItems.toString(),
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

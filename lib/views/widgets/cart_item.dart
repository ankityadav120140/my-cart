// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cart/contollers/cart_controller.dart';
import 'package:sizer/sizer.dart';

import '../../models/product.dart';

Widget CartItem(Product cartItem, int quantity) {
  CartController cartController = Get.find();
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(10),
    ),
    height: 31.h,
    margin: EdgeInsets.all(1.w),
    child: Row(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 1.h),
              child: Image.network(
                cartItem.imgPath,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    cartController.removeItemFromCart(cartItem);
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                  ),
                ),
                Text("${quantity}"),
                IconButton(
                  onPressed: () {
                    cartController.addItemToCart(cartItem);
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 2.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),
            Container(
              width: 40.w,
              child: Text(
                cartItem.name,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 1.h),
            Container(
              width: 40.w,
              child: Text(
                "\$${cartItem.price}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 40.w,
              child: Text(
                "Eligible for free shipping",
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
            Container(
              width: 40.w,
              child: Text(
                "In Stock",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.green,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cartItem.rating.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.amber,
                  ),
                ),
                Icon(
                  Icons.star,
                  size: 16.sp,
                  color: Colors.amber,
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 1.h, left: 2.w),
              child: ElevatedButton(
                onPressed: () {
                  cartController.deleteItemFromCart(cartItem);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    Text("Delete"),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

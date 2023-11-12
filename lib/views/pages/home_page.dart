// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cart/contollers/cart_controller.dart';
import 'package:my_cart/views/widgets/cart_icon.dart';
import 'package:sizer/sizer.dart';
import '../../contollers/product_controller.dart';
import '../widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.find();
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.w,
        actions: [
          IconButton(
            icon: Obx(
              () {
                return CartIcon();
              },
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Obx(
        () {
          if (productController.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (productController.productList.isEmpty) {
              return Center(
                child: Text("No item found"),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    productController.productList[index],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

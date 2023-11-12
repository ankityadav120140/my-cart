// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cart/consts/constants.dart';
import 'package:my_cart/contollers/cart_controller.dart';
import 'package:sizer/sizer.dart';
import '../../models/product.dart';

class ProductTile extends StatelessWidget {
  final CartController cartController = Get.find();
  final Product product;
  ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 21.h,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  product.imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: product.isFavorite.value
                          ? Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.blue,
                            ),
                      onPressed: () {
                        product.isFavorite.toggle();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 0.5.h),
          Container(
            height: 14.2.h,
            padding: EdgeInsets.all(1.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'avenir', fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.5.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.rating.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.star,
                                size: 16.sp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          '\$${product.price}',
                          style:
                              TextStyle(fontSize: 15.sp, fontFamily: 'avenir'),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        cartController.addItemToCart(product);
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 2.w),
                          padding: EdgeInsets.all(2.w),
                          width: 6.h,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              shape: BoxShape.circle,
                              border: Border.all()),
                          child: Image.asset(
                            ADD_TO_CART_ICON,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

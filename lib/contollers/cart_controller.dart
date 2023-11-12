import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product, int>{}.obs;

  double get totalPrice {
    return cartItems.entries.fold(0.0, (sum, entry) {
      final product = entry.key;
      final quantity = entry.value;
      return sum + (product.price * quantity);
    });
  }

  int get totalItems {
    return cartItems.entries.fold(0, (total, entry) {
      final quantity = entry.value;
      return total + quantity;
    });
  }

  void addItemToCart(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = (cartItems[product] ?? 0) + 1;
    } else {
      cartItems[product] = 1;
    }
  }

  void removeItemFromCart(Product product) {
    if (cartItems.containsKey(product)) {
      if (cartItems[product]! > 1) {
        cartItems[product] = cartItems[product]! - 1;
      } else {
        cartItems.remove(product);
      }
    }
  }

  void deleteItemFromCart(Product product) {
    cartItems.remove(product);
  }
}

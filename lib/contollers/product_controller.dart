import 'package:get/state_manager.dart';
import '../models/product.dart';
import '../services/shopping_repository.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      var shoppingRepo = ShoppingRepository();
      isLoading(true);
      var products = await shoppingRepo.getProducts();
      productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }
}

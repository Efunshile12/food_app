import 'package:aprilskuisine/controllers/auth_controller.dart';
import 'package:aprilskuisine/controllers/cart_controller.dart';
import 'package:aprilskuisine/controllers/popular_product_list.dart';
import 'package:aprilskuisine/controllers/recommended_product_controller.dart';
import 'package:aprilskuisine/controllers/user_controller.dart';
import 'package:aprilskuisine/data/api/api_client.dart';
import 'package:aprilskuisine/data/repository/CART_REPO.dart';
import 'package:aprilskuisine/data/repository/auth_repo.dart';
import 'package:aprilskuisine/data/repository/popular_product.dart';
import 'package:aprilskuisine/data/repository/recommended_product_repo.dart';
import 'package:aprilskuisine/data/repository/user_repo.dart';
import 'package:aprilskuisine/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(
        apiClient: Get.find(),
      ));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));


  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));

  Get.lazyPut(() => PopularProductController(
        popularProductRepo: Get.find(),
      ));

  Get.lazyPut(() => RecommendedProductController(
        recommendedProductRepo: Get.find(),
      ));
  Get.lazyPut(() => PopularProductController(
        popularProductRepo: Get.find(),
      ));
  Get.lazyPut(() => CartController(
        cartRepo: Get.find(),
      ));
}

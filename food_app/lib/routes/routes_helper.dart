import 'package:aprilskuisine/cart/cartpage.dart';
// import 'package:aprilskuisine/home/food/homepage.dart';
import 'package:aprilskuisine/home/food/popular_food_detail.dart';

import 'package:aprilskuisine/home/food/recomended_food_detail.dart';

import 'package:aprilskuisine/home/pages/account_page.dart';
// import 'package:aprilskuisine/home/pages/main_foot_page.dart';
import 'package:aprilskuisine/home/pages/my_home_page.dart';
import 'package:aprilskuisine/home/pages/sign_in_page.dart';
import 'package:aprilskuisine/home/pages/splash_page.dart';
import 'package:aprilskuisine/home/pages/welcomePage.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class RouteHelper {
  static const String signInPage = "/signInPage";
  static const String accountPage = "/accountPage";
  static const String splashPage = "/splashPage";
  static const String welcomepage = "/myHomePage2";
  static const String cartPage = "/cart-Page";
  static const String initial = "/";
  static const String popularFood = "/popular_food";
  static const String recommendedFood = "/recommended_food";
  static const String popularFood2 = "/popular_food2";
  static const String recommendedFood2 = "/recommended_food2";

  static String getSplashPage() => "$splashPage";
  static String getAccountPage() => "$accountPage";
  static String getSignInPage() => "$signInPage";
  static String getWelcomepage() => "$welcomepage";
  static String getCartPage() => "$cartPage";
  static String getInitial() => "$initial";

  static String getPopularFood2(int pageId, String page) =>
      "$popularFood2?pageId=$pageId&page=$page";
  static String getRecommendedFood2(int pageId, String page) =>
      "$recommendedFood2?pageId=$pageId&page=$page";

  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";

  static List<GetPage> routes = [
    GetPage(name: signInPage, page: () => const SignInPage()),
    GetPage(name: accountPage, page: () => const AccountPage()),
    GetPage(name: splashPage, page: () => const SplashPage()),
    GetPage(name: welcomepage, page: () => const Welcomepage()),
    GetPage(name: initial, page: () => const MyHomePage2()),

 
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          return const CartPage();
        },
        transition: Transition.fadeIn),
  ];
}

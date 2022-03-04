import 'package:aprilskuisine/controllers/popular_product_list.dart';

import 'package:aprilskuisine/controllers/recommended_product_controller.dart';

import 'package:aprilskuisine/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(
        builder: (_) {
          // return GetBuilder<PopularProductController2>(builder: (_) {
          //   return GetBuilder<RecommendedProductController2>(
          //     builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              primarySwatch: Colors.green,
              scaffoldBackgroundColor: Colors.transparent,
              fontFamily: 'Roboto',
              hintColor: Colors.white,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.white),
              ),
            ),
            // home:SplashScreen(),
            // MainFoodPage(),
            // const OnboardScreen(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes,
          );
        },
      );
    });
    // });
    //   });
  }
}

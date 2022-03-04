import 'package:aprilskuisine/cart/cartpage.dart';
import 'package:aprilskuisine/controllers/popular_product_list.dart';
import 'package:aprilskuisine/home/pages/account_page.dart';
import 'package:aprilskuisine/home/pages/carthistory.dart';

import 'package:aprilskuisine/home/pages/main_foot_page.dart';
import 'package:aprilskuisine/home/pages/sign_in_page.dart';

import 'package:aprilskuisine/home/pages/welcomePage.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  int _page = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  // late PersistentTabControlller _controlller

  final List<Widget> _listPages = [
    const MainFoodPage(),
    const Welcomepage(),
    const SignInPage(),
    // const MainFoodPage2(),
    const CartHistory(),

    const AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: const <Widget>[
            Icon(Icons.home, size: 25),
            Icon(Icons.list, size: 25),
            Icon(Icons.compare_arrows, size: 25),
            Icon(Icons.shopping_cart, size: 25),
            // Column(
            //   children: [

            //     Stack(
            //       children: [
            //         AppIcon(
            //           icon: Icons.shopping_cart_outlined,
            //         ),
            //         Get.find<PopularProductController>().totalItems >= 1
            //             ? Positioned(
            //                 right: 0,
            //                 top: 0,
            //                 child: AppIcon(
            //                   icon: Icons.circle,
            //                   size: Dimensions.height20,
            //                   iconColor: Colors.transparent,
            //                   backgroundColor: AppColors.mainColor,
            //                 ),
            //               )
            //             : Container(),
            //         Get.find<PopularProductController>().totalItems >= 1
            //             ? Positioned(
            //                 right: 0,
            //                 top: 0,
            //                 child: BigText(
            //                     text: Get.find<PopularProductController>()
            //                         .totalItems
            //                         .toString(),
            //                     size: Dimensions.height12,
            //                     color: Colors.white),
            //               )
            //             : Container(),
            //       ],
            //     ),
            //   ],
            // ),
            Icon(Icons.perm_identity, size: 20),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.green.shade600,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: _listPages[_page]);
  }
}

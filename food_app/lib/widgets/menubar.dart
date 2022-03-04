import 'package:aprilskuisine/home/pages/carthistory.dart';
import 'package:aprilskuisine/home/pages/carthistory.dart';
import 'package:aprilskuisine/home/pages/login_page.dart';
import 'package:aprilskuisine/routes/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: (60),
                  backgroundColor: Colors.black54,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/image/madam.png",
                      fit: BoxFit.fill,
                      matchTextDirection: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  " Kuisine",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () {
              Get.offNamed(RouteHelper.getAccountPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My Order'),
            onTap: () {
              Get.offNamed(RouteHelper.getCartPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.maps_ugc_outlined,
            ),
            title: const Text('Track your Order'),
            onTap: () => const CartHistory(),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

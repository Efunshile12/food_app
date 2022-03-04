import 'package:aprilskuisine/utils/dimensions.dart';
import 'package:aprilskuisine/widgets/ScaleRoute.dart';
import 'package:aprilskuisine/widgets/menubar.dart';
import 'package:aprilskuisine/widgets/searchBar.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'my_home_page.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({Key? key}) : super(key: key);

  @override
  _WelcomepageState createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NavDrawer()));
            },
            child: const Icon(
              Icons.menu,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchBar()));
                },
                child: const Icon(Icons.search, size: 26),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {}, child: const Icon(Icons.more_vert_rounded)))
          ]),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/madam.png"),
            fit: BoxFit.cover,
            opacity: 200,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        SizedBox(height: Dimensions.height20 * 3),
                        Column(
                          children: const [
                            SizedBox(
                              child: Text(
                                "April's Kuisine",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              "...soup, stew and everthing inbetween",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Place your Order',
                        style:
                            //  GoogleFonts.sail(
                            //   textStyle: const
                            TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: (70),
                                        backgroundColor: Colors.green.shade400,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            "assets/image/2.png",
                                            fit: BoxFit.fill,
                                            matchTextDirection: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        ScaleRoute(page: const MyHomePage2()));
                                  },
                                  child: const Text(
                                    "Soup",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green.shade600,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: (70),
                                      backgroundColor: Colors.red.shade400,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/image/1.png",
                                          fit: BoxFit.fill,
                                          matchTextDirection: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Stew",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade600,
        onPressed: () {},
        tooltip: 'Costumize your Meal',
        child: const Icon(
          Icons.maps_home_work,
          size: 30,
        ),
      ),
    );
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:kuisine/components/cart.dart';
// import 'package:kuisine/components/defaultElements.dart';
// import 'package:kuisine/components/food_odject.dart';
// import 'package:kuisine/models/food_model.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Soup> _dishes = <Soup>[];

//   final List<Soup> _cartList = <Soup>[];

//   @override
//   void initState() {
//     super.initState();
//     _soupListDishes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0, top: 8.0),
//             child: GestureDetector(
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: <Widget>[
//                   const Icon(
//                     Icons.shopping_cart,
//                     size: 36.0,
//                   ),
//                   if (_cartList.length > 0)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 2.0),
//                       child: CircleAvatar(
//                         radius: 8.0,
//                         backgroundColor: Colors.red,
//                         foregroundColor: Colors.white,
//                         child: Text(
//                           _cartList.length.toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               onTap: () {
//                 if (_cartList.isNotEmpty) {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => Cart(_cartList),
//                     ),
//                   );
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//       body: _buildGridView(),
//     );
//   }

//   ListView _buildListView() {
//     return ListView.builder(
//       itemCount: _dishes.length,
//       itemBuilder: (context, index) {
//         var item = _dishes[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 8.0,
//             vertical: 2.0,
//           ),
//           child: Card(
//             elevation: 4.0,
//             child: ListTile(
//               leading: Image(
//                 item.soupimage,
//                 color: item.color,
//               ),
//               title: Text(item.name),
//               trailing: GestureDetector(
//                 child: (!_cartList.contains(item))
//                     ? const Icon(
//                         Icons.add_circle,
//                         color: Colors.green,
//                       )
//                     : const Icon(
//                         Icons.remove_circle,
//                         color: Colors.red,
//                       ),
//                 onTap: () {
//                   setState(() {
//                     if (!_cartList.contains(item)) {
//                       _cartList.add(item);
//                     } else {
//                       _cartList.remove(item);
//                     }
//                   });
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   GridView _buildGridView() {
//     return GridView.builder(
//         padding: const EdgeInsets.all(4.0),
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: _dishes.length,
//         itemBuilder: (context, index) {
//           var item = _dishes[index];
//           return Card(
//               elevation: 4.0,
//               child: Stack(
//                 fit: StackFit.loose,
//                 alignment: Alignment.center,
//                 children: <Widget>[
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         item.icon,
//                         color: (_cartList.contains(item))
//                             ? Colors.grey
//                             : item.color,
//                         size: 100.0,
//                       ),
//                       Text(
//                         item.soupName,
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.subtitle1,
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       right: 8.0,
//                       bottom: 8.0,
//                     ),
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: GestureDetector(
//                         child: (!_cartList.contains(item))
//                             ? const Icon(
//                                 Icons.add_circle,
//                                 color: Colors.green,
//                               )
//                             : const Icon(
//                                 Icons.remove_circle,
//                                 color: Colors.red,
//                               ),
//                         onTap: () {
//                           setState(() {
//                             if (!_cartList.contains(item)) {
//                               _cartList.add(item);
//                             } else {
//                               _cartList.remove(item);
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ));
//         });
//   }

//  void _soupListDishes() {
//     var list = <SoupListModel>  [
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorpink,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorpink,
//         soupimage: "assets/images/images/egusi (2).jpeg",
//         persentage: "Soup",
//         soupDescription:
//             'Egusi soup is an exotic hearty food that will satisify your taste buds. It is a staple in most West African home and it is an uncompilated one pot meal that is often accompanied with swallows like Amala, Semovita, Eba, Pounded yam, Fufu and the likes.',
//         soupName: "Egusi Soup",
//         price: 5000,
//         id: 1,
//         showpersentage: true,
//         activeheart: true,
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/afang.jpeg",
//         persentage: "Soup",
//         soupName: "Afang Soup",
//         price: 5000,
//         id: 2,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Afang soup, is a vegetable soup that originates from the Efik people of the Efik kingdom in Cross River State and Ibibio People of Awka Ibom in Southern Nigeria',
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/okro (2).jpeg",
//         persentage: "Soup",
//         soupName: "Okro Soup",
//         price: 5000,
//         id: 3,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Okro soup is prepared using the edible green seed pods of the okra flowering plant as a primary ingredient. It is greenish in Colour',
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/oha soup.jpeg",
//         persentage: "50",
//         soupName: "Oha Soup",
//         price: 6000,
//         id: 4,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Oha soup is native to the South Eastern Nigeria. It is a very traditional soup similar to the bitterleaf soup but cooked with Oha leaves ',
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/edikankang.jpeg",
//         persentage: "Soup",
//         soupName: "Edikankong Soup",
//         price: 5000,
//         id: 5,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Edikang ikong is a vegetable soup that originated among the Efik people of Cross River State and Akwa Ibom state in Southern Nigeria',
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/ogbono.jpeg",
//         persentage: "Soup",
//         soupName: "Ogbono Soup",
//         price: 5000,
//         id: 6,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Ogbono Soup, is a Nigerian dish made with ground dry ogbono seed. Ogbono seeds are originated and were first grown in Southern Nigeria with considerable local variation. ',
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/Ofe-Nsala.jpg",
//         persentage: "",
//         soupName: "Ofe Nsala Soup",
//         price: 6000,
//         id: 7,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Ofe Nsala soup is made with small pieces of yam with utazi leaves. The soup originates from the Eastern part of Nigeria. A major ingredient of Nsala Soup is the cat fish which gives the soup a unique taste. ',
//       ),
//       SoupListModel(
//         showcasebgcolor: DefaultElements.kshoebgcolorblue,
//         lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//         soupimage: "assets/images/images/fisherman.jpeg",
//         persentage: "Soup",
//         soupName: "FisherMan Soup",
//         price: 6000,
//         id: 8,
//         showpersentage: true,
//         activeheart: true,
//         soupDescription:
//             'Fisherman soup is a hot, spicy paprika-based fish soup. A folk item of Hungarian Cuisine, it is a bright-red hot dish prepared with generous amount of hot paprika and carp or mixed river fish ',
//       ),
//     ];
//        setState(() {
//       soupListModel = list;
//     });
//   }
//   }
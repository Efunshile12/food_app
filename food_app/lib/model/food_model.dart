class FoodListModel {
  String soupimage;
  String persentage;
  String soupName;
  String soupDescription;
  double price;
  int id;
  bool showpersentage;
  bool activeheart;
  int? soupId;

  FoodListModel({
    this.soupId,
    required this.soupDescription,
    required this.soupimage,
    required this.persentage,
    required this.soupName,
    required this.price,
    required this.id,
    required this.showpersentage,
    required this.activeheart,
  });

  factory FoodListModel.fromJson(Map<String, dynamic> json) {
    return FoodListModel(
      id: json['id'],
      showpersentage: json['showpersentage'] == 1,
      persentage: json['persentage'],
      price: json['price'],
      soupimage: json['soupimage'],
      soupName: json['name'],
      activeheart: json['activeheart'] == 1,
      soupDescription: json['soupDescription'],
      soupId: json['soup_id'] ?? 0,
    );
  }
}

List<FoodListModel> soupListModel = [
  FoodListModel(
    soupimage: "assets/image/afang.jpeg",
    persentage: "Soup",
    soupName: "Afang Soup",
    price: 5000,
    id: 2,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Afang soup, is a vegetable soup that originates from the Efik people of the Efik kingdom in Cross River State and Ibibio People of Awka Ibom in Southern Nigeria',
  ),
  FoodListModel(
    soupimage: "assets/image/egusi (2).jpeg",
    persentage: "Soup",
    soupDescription:
        'Egusi soup is an exotic hearty food that will satisify your taste buds. It is a staple in most West African home and it is an uncompilated one pot meal that is often accompanied with swallows like Amala, Semovita, Eba, Pounded yam, Fufu and the likes.',
    soupName: "Egusi Soup",
    price: 5000,
    id: 1,
    showpersentage: true,
    activeheart: true,
  ),
  FoodListModel(
    soupimage: "assets/image/okro (2).jpeg",
    persentage: "Soup",
    soupName: "Okro Soup",
    price: 5000,
    id: 3,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Okro soup is prepared using the edible green seed pods of the okra flowering plant as a primary ingredient. It is greenish in Colour',
  ),
  FoodListModel(
    soupimage: "assets/image/oha soup.jpeg",
    persentage: "50",
    soupName: "Oha Soup",
    price: 6000,
    id: 4,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Oha soup is native to the South Eastern Nigeria. It is a very traditional soup similar to the bitterleaf soup but cooked with Oha leaves ',
  ),
  FoodListModel(
    soupimage: "assets/image/edikankang.jpeg",
    persentage: "Soup",
    soupName: "Edikankong Soup",
    price: 5000,
    id: 5,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Edikang ikong is a vegetable soup that originated among the Efik people of Cross River State and Akwa Ibom state in Southern Nigeria',
  ),
  FoodListModel(
    soupimage: "assets/image/ogbono.jpeg",
    persentage: "Soup",
    soupName: "Ogbono Soup",
    price: 5000,
    id: 6,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Ogbono Soup, is a Nigerian dish made with ground dry ogbono seed. Ogbono seeds are originated and were first grown in Southern Nigeria with considerable local variation. ',
  ),
  FoodListModel(
    soupimage: "assets/image/Ofe-Nsala.jpg",
    persentage: "",
    soupName: "Ofe Nsala Soup",
    price: 6000,
    id: 7,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Ofe Nsala soup is made with small pieces of yam with utazi leaves. The soup originates from the Eastern part of Nigeria. A major ingredient of Nsala Soup is the cat fish which gives the soup a unique taste. ',
  ),
  FoodListModel(
    soupimage: "assets/image/fisherman.jpeg",
    persentage: "Soup",
    soupName: "FisherMan Soup",
    price: 6000,
    id: 8,
    showpersentage: true,
    activeheart: true,
    soupDescription:
        'Fisherman soup is a hot, spicy paprika-based fish soup. A folk item of Hungarian Cuisine, it is a bright-red hot dish prepared with generous amount of hot paprika and carp or mixed river fish ',
  ),
];

var data2 = [
  {
    "showcasebgcolor": "DefaultElements.kshoebgcolorblue",
    "lightShowcasebgcolo": "DefaultElements.lightShowcasebgcolorblue",
    "stewimage": "assets/images/images/fish stew.jpeg",
    "persentage": "Stew",
    "stewName": "Fish Stew",
    "price": 5000,
    "id": "Stew",
    "showpersentage": true,
    "activeheart": true,
    "stewDescription":
        'Fresh fish stew is a healthy Nigerian stew that is cooked wth fresh tomatoes, peppers and spices. It is a great substitute for the Beef and Chicken stew especially if you are watching your weight and also on a low calorie diet',
  },
  {
    "showcasebgcolor": "DefaultElements.kshoebgcolorblue",
    "lightShowcasebgcolor": "DefaultElements.lightShowcasebgcolorblue",
    "stewimage": "assets/images/images/chicken stew.jpeg",
    "persentage": "Stew",
    "stewName": "Chicken/Turkey Stew",
    "price": 5500,
    "id": "5",
    "showpersentage": true,
    "activeheart": true,
    "stewDescription":
        "Chicken/ Turkey stew is a delicious meal with chicken/turkey, potatoes and sweet potatoes, onions and carrot. It's one of our all time favourite meals",
  },
  {
    "showcasebgcolor": "DefaultElements.kshoebgcolorblue",
    "lightShowcasebgcolor": "DefaultElements.lightShowcasebgcolorblue",
    "stewimage": "assets/images/images/ofe akwu.jpeg",
    "persentage": "Stew",
    "stewName": "Ofe Akwu",
    "price": 6000,
    "id": "5",
    "showpersentage": true,
    "activeheart": true,
    "stewDescription":
        'Palm nut soup also known as Ofe Akwu is a delicious African delicacy made from creamy extract got from pulverized pam nut fruit',
  },
  {
    "showcasebgcolor": "DefaultElements.kshoebgcolorblue",
    "lightShowcasebgcolor": "DefaultElements.lightShowcasebgcolorblue",
    "stewimage": "assets/images/images/beef stew.jpeg",
    "persentage": "Stew",
    "stewName": "Beef Stew",
    "price": 5000,
    "id": "5",
    "showpersentage": true,
    "activeheart": true,
    "stewDescription":
        'Beef Stew is a food dish that combines beef with a variety of other ingredients, such as potatoes, vegetable, herbs, spices, and broth to create a savory dish',
  },
];

// class StewListModel {
//   String stewimage;
//   String persentage;
//   String stewName;
//   String stewDescription;
//   double price;
//   String id;
//   bool showpersentage;
//   bool activeheart;
//   Color showcasebgcolor;
//   Color lightShowcasebgcolor;

//   StewListModel({
//     required this.stewDescription,
//     required this.stewimage,
//     required this.persentage,
//     required this.stewName,
//     required this.price,
//     required this.id,
//     this.showpersentage = true,
//     this.activeheart = true,
//     required this.showcasebgcolor,
//     required this.lightShowcasebgcolor,
//   });
//   factory StewListModel.fromJson(Map<String, dynamic> json) {
//     return StewListModel(
//       id: json['id'],
//       showpersentage: json['showpersentage'] == 1,
//       persentage: json['persentage'],
//       price: json['price'],
//       stewimage: json['soupimage'],
//       stewName: json['name'],
//       activeheart: json['activeheart'] ?? 0,
//       lightShowcasebgcolor: json['lightShowcasebgcolor'],
//       showcasebgcolor: json['showcasebgcolor'],
//       stewDescription: '',
//     );
//   }
// }

// List<StewListModel> stewListModel = [
//   StewListModel(
//     showcasebgcolor: DefaultElements.kshoebgcolorblue,
//     lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//     stewimage: "assets/images/images/fish stew.jpeg",
//     persentage: "Stew",
//     stewName: "Fish Stew",
//     price: 5000,
//     id: "Stew",
//     showpersentage: true,
//     activeheart: true,
//     stewDescription:
//         'Fresh fish stew is a healthy Nigerian stew that is cooked wth fresh tomatoes, peppers and spices. It is a great substitute for the Beef and Chicken stew especially if you are watching your weight and also on a low calorie diet',
//   ),
//   StewListModel(
//       showcasebgcolor: DefaultElements.kshoebgcolorblue,
//       lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//       stewimage: "assets/images/images/chicken stew.jpeg",
//       persentage: "Stew",
//       stewName: "Chicken/Turkey Stew",
//       price: 5500,
//       id: "5",
//       showpersentage: true,
//       activeheart: true,
//       stewDescription:
//           "Chicken/ Turkey stew is a delicious meal with chicken/turkey, potatoes and sweet potatoes, onions and carrot. It's one of our all time favourite meals"),
//   StewListModel(
//     showcasebgcolor: DefaultElements.kshoebgcolorblue,
//     lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//     stewimage: "assets/images/images/ofe akwu.jpeg",
//     persentage: "Stew",
//     stewName: "Ofe Akwu",
//     price: 6000,
//     id: "5",
//     showpersentage: true,
//     activeheart: true,
//     stewDescription:
//         'Palm nut soup also known as Ofe Akwu is a delicious African delicacy made from creamy extract got from pulverized pam nut fruit',
//   ),
//   StewListModel(
//     showcasebgcolor: DefaultElements.kshoebgcolorblue,
//     lightShowcasebgcolor: DefaultElements.lightShowcasebgcolorblue,
//     stewimage: "assets/images/images/beef stew.jpeg",
//     persentage: "Stew",
//     stewName: "Beef Stew",
//     price: 5000,
//     id: "5",
//     showpersentage: true,
//     activeheart: true,
//     stewDescription:
//         'Beef Stew is a food dish that combines beef with a variety of other ingredients, such as potatoes, vegetable, herbs, spices, and broth to create a savory dish',
//   ),
// ];

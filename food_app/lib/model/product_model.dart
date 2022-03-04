class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;

  List<ProductModel> get products => _products;

  Product(
      {required totalSize,
      required products,
      required typeId,
      required offset}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total size'];
    _typeId = json['type.id'];
    _offset = json['offset'];

    if (json['products'] != null) {
      _products = <ProductModel>[];
      json["products"].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? typeId;
  String? location;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    required this.updatedAt,
    this.typeId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['typeId'];
    stars = json['stars'];
    price = json['price'];
    img = json['img'];
    name = json['name'];
    location = json['location'];
    createdAt = json['createdAt'];
    location = json['location'];
    description = json['description'];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "img": img,
      "location": location,
      "createdAt": createdAt,
      "description": description,
      "typeId": typeId,
      "updatedAt": updatedAt,
    };
  }
}

//  {

// "total size": 8,
// "type_id":2,
// "offset":0,
// "products":[


// {"total_ size":8,"type_id":2, "offset":0,
// "products":[{"id":1,
//     "img": "assets/image/okro (2).jpeg",
//     "name": "Okro Soup",
//     "price": 5000,
//         "type_id":2,0
//     "description":
//         'Okro soup is prepared using the edible green seed pods of the okra flowering plant as a primary ingredient. It is greenish in Colour',
//     "updatedAt": '18:02:2022', 
//     "stars": 5,
// "location": "Nigeria, Lagos",
//     },
//     {
//   "id":2,
//     "img": "assets/image/fisherman.jpeg",
//     "name": "FisherMan Soup",
//     "price": 6000,
// "location": "Nigeria, Lagos",
//         "type_id":2,
//     "description":6,
//         'Fisherman soup is a hot, spicy paprika-based fish soup. A folk item of Hungarian Cuisine, it is a bright-red hot dish prepared with generous amount of hot paprika and carp or mixed river fish ',
//   " updatedAt": '18:02:2022',
//   " stars":" 5",
//     },
//  {
//     "id":3,
//     "img": "assets/image/edikankang.jpeg",
//     "name": "Edikankong Soup",
//     "price": 5000,
//        "type_id":2,
//     "description":
//         'Edikang ikong is a vegetable soup that originated among the Efik people of Cross River State and Akwa Ibom state in Southern Nigeria',
//    "updatedAt": '18:02:2022',
//    " stars": 5,
//  },
//   {
//       "id":4,
//     "img": "assets/image/afang.jpeg",
//     "name": "Afang Soup",
//     "price": 5000,
//         "type_id":2,
//     "description":
//         'Afang soup, is a vegetable soup that originates from the Efik people of the Efik kingdom in Cross River State and Ibibio People of Awka Ibom in Southern Nigeria',
//   " updatedAt": '18:02:2022',
//     "stars": 5,
//   },
//   {
//         "id":5,
//     "img": "assets/image/egusi (2).jpeg",
//     "description":
//         'Egusi soup is an exotic hearty food that will satisify your taste buds. It is a staple in most West African home and it is an uncompilated one pot meal that is often accompanied with swallows like Amala, Semovita, Eba, Pounded yam, Fufu and the likes.',
//     "name": "Egusi Soup",
//     "price": 5000,
//     "type_id": 4,
//         "type_id":2,
//    "updatedAt": '18:02:2022',
//     "stars": 5,
//   },
//  {
//         "id":6,
//     "img": "assets/image/oha soup.jpeg",
//     "name": "Oha Soup",
//     "price": 6000,
//     "typeId": 5,
//         "type_id":2,
//     "description":
//         'Oha soup is native to the South Eastern Nigeria. It is a very traditional soup similar to the bitterleaf soup but cooked with Oha leaves ',
//    "updatedAt": '18:02:2022',
//     "stars": 5,
//  },
//   {
//           "id":7,
//     "img": "assets/image/ogbono.jpeg",
//     "name": "Ogbono Soup",
//     "price": 5000,
//         "type_id":2,
//     "typeId": 7,
//     "description":
//         'Ogbono Soup, is a Nigerian dish made with ground dry ogbono seed. Ogbono seeds are originated and were first grown in Southern Nigeria with considerable local variation. ',
//    "updatedAt": '18:02:2022',
//     "stars": 5,
//   },
//   {
// "id":7,
//     "img": "assets/image/Ofe-Nsala.jpg",
//     "name": "Ofe Nsala Soup",
//     "price": 6000,
//     "typeId": 8,
//     "description":
//         'Ofe Nsala soup is made with small pieces of yam with utazi leaves. The soup originates from the Eastern part of Nigeria. A major ingredient of Nsala Soup is the cat fish which gives the soup a unique taste. ',
//     "updatedAt": '2022-02-14  08:27:23',
//     "type_id":2,
//     "star": 5,
// "created_at": '2-22-02-16 08:45:33',
//   }
// ]

//   }

 

// class FoodModel{
 
//   int? id;
//   String? name;
//   String? description;
//   int? price;
//   int? stars;
//   String? img;
//   String? createdAt;
//   String? updatedAt;
//   int? typeId;
//   String? location;

//   late List<FoodModel> _products;

//   List<FoodModel> get products => _products;

//   FoodModel(
//       {this.name,
//       this.description,
//       this.price,
//       this.stars,
//       this.img,
//       this.location,
//       this.createdAt,
//       required this.updatedAt,
//       this.typeId,
//       })
      // required  totalSize,
      // required products
      
    // ({
    // required totalSize,
    //   required products,
    //   required typeId,
    //   required offset
    //   })
    // {
    // this._totalSize = totalSize;
    // this._typeId = typeId;
    // this._offset = offset;
    // this._products = products;
    // }
      
      
      


// List<FoodModel> product = [
//   FoodModel(
//     img: "assets/image/okro (2).jpeg",
//     name: "Okro Soup",
//     price: 5000,
//     typeId: 1,
//     description:
//         'Okro soup is prepared using the edible green seed pods of the okra flowering plant as a primary ingredient. It is greenish in Colour',
//     updatedAt: '', 
//   ),
// //  FoodModel(
// //     img: "assets/image/fisherman.jpeg",
// //     name: "FisherMan Soup",
// //     price: 6000,
// //     typeId: 8,
// //     description:
// //         'Fisherman soup is a hot, spicy paprika-based fish soup. A folk item of Hungarian Cuisine, it is a bright-red hot dish prepared with generous amount of hot paprika and carp or mixed river fish ',
// //     updatedAt: '',
// //   ),
// //  FoodModel(
// //     img: "assets/image/edikankang.jpeg",
// //     name: "Edikankong Soup",
// //     price: 5000,
// //     typeId: 2,
// //     description:
// //         'Edikang ikong is a vegetable soup that originated among the Efik people of Cross River State and Akwa Ibom state in Southern Nigeria',
// //     updatedAt: '',
// //   ),
// //   FoodModel(
// //     img: "assets/image/afang.jpeg",
// //     name: "Afang Soup",
// //     price: 5000,
// //     typeId: 3,
// //     description:
// //         'Afang soup, is a vegetable soup that originates from the Efik people of the Efik kingdom in Cross River State and Ibibio People of Awka Ibom in Southern Nigeria',
// //     updatedAt: '',
// //   ),
//   // FoodModel(
//   //   img: "assets/image/egusi (2).jpeg",
//   //   description:
//   //       'Egusi soup is an exotic hearty food that will satisify your taste buds. It is a staple in most West African home and it is an uncompilated one pot meal that is often accompanied with swallows like Amala, Semovita, Eba, Pounded yam, Fufu and the likes.',
//   //   name: "Egusi Soup",
//   //   price: 5000,
//   //   updatedAt: '',
//   //   stars: 4,
//   // ),
//   // FoodModel(
//   //   img: "assets/image/oha soup.jpeg",
//   //   name: "Oha Soup",
//   //   price: 6000,
//   //   typeId: 5,
//   //   description:
//   //       'Oha soup is native to the South Eastern Nigeria. It is a very traditional soup similar to the bitterleaf soup but cooked with Oha leaves ',
//   //   updatedAt: '',
//   // ),
//   // FoodModel(
//   //   img: "assets/image/ogbono.jpeg",
//   //   name: "Ogbono Soup",
//   //   price: 5000,
//   //   typeId: 6,
//   //   description:
//   //       'Ogbono Soup, is a Nigerian dish made with ground dry ogbono seed. Ogbono seeds are originated and were first grown in Southern Nigeria with considerable local variation. ',
//   //   updatedAt: '',
//   // ),
//   // FoodModel(
//   //   img: "assets/image/Ofe-Nsala.jpg",
//   //   name: "Ofe Nsala Soup",
//   //   price: 6000,
//   //   typeId: 7,
//   //   description:
//   //       'Ofe Nsala soup is made with small pieces of yam with utazi leaves. The soup originates from the Eastern part of Nigeria. A major ingredient of Nsala Soup is the cat fish which gives the soup a unique taste. ',
//   //   updatedAt: '',
// //   ),
// // ];
// // 
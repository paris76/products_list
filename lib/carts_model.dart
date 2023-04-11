class Object2 {
  final Carts carts;
  final int total2;
  final int skip2;
  final int limit2;

  Object2({required this.carts, required this.total2, required this.skip2, required this.limit2, });

factory Object2.fromJson(Map<String, dynamic> json) {
    return Object2(
       carts:  Carts.fromJson(json['carts']),
       total2: json[' total'],
       skip2: json['skip'],
       limit2: json['limit'],
    );
  }
}
class Carts {
  final int id;
  final int total;
  final int discountedtotal;
  final int userid;
  final int totalproducts;
  final int totalquantity;
  final Products2? product;

  Carts({required this.id, required this.total, required this.discountedtotal, required this.userid, required this.totalproducts, required this.totalquantity,  this.product});

factory Carts.fromJson(Map<String, dynamic> json) {
    return Carts(
      id: json['id'],
      total: json['total'],
       discountedtotal: json['discountedTotal'],
       userid: json['userId'],
       totalproducts: json['totalProducts'],
      totalquantity: json['totalQuantity'],
    product: Products2.fromJson(json['products'])
    );
  }
}
class Products2 {
  final Products0 list0;
  final Products1 list1;
  final Products02 list2;
  final Products3 list3;
  final Products4 list4;
  
  Products2({required this.list0, required this.list1, required this.list2, required this.list3, required this.list4});

factory Products2.fromJson(Map<String, dynamic> json) {
    return Products2(
      list0: json['0'],
     list1: json['1'],
      list2: json['2'],
      list3: json['3'],
     list4: json['4'],
    );
  }
}
class Products0 {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  
  Products0({required this.id, required this.title, required this.price, required this.quantity, required this.total});

factory Products0.fromJson(Map<String, dynamic> json) {
    return Products0(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  } 
}
class Products1 {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  
  Products1({required this.id, required this.title, required this.price, required this.quantity, required this.total});

factory Products1.fromJson(Map<String, dynamic> json) {
    return Products1(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  } 
}
class Products02 {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  
  Products02({required this.id, required this.title, required this.price, required this.quantity, required this.total});

factory Products02.fromJson(Map<String, dynamic> json) {
    return Products02(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  } 
}
class Products3 {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  
  Products3({required this.id, required this.title, required this.price, required this.quantity, required this.total});

factory Products3.fromJson(Map<String, dynamic> json) {
    return Products3(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  } 
}
class Products4 {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int total;
  
  Products4({required this.id, required this.title, required this.price, required this.quantity, required this.total});

factory Products4.fromJson(Map<String, dynamic> json) {
    return Products4(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  } 
}
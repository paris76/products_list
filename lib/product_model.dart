class Object {
  final List <Products> products;
  final int total;
  final int skip;
  final int limit;

  Object({required this.products, required this.total, required this.skip, required this.limit, });

factory Object.fromJson(Map<String, dynamic> json) {
  var productFirst = json['products'] as List;
  var productMapped = productFirst.map((e) =>  Products.fromJson(e)).toList(); 
    return Object(
       products:  productMapped,
       total: json['total'],
       skip: json['skip'],
       limit: json['limit'],
    );
  }
}
class Products {
  final int id;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;
  final List<dynamic> image;

  Products({required this.id, required this.title, required this.description, required this.price, required this.brand, required this.category, required this.image,});

factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      title: json['title'],
       description: json['description'],
       price: json['price'],
       brand: json['brand'],
      category: json['category'],
    image: json['images'] as List<dynamic>,
    );
  }
}

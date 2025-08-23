class ProductModel {
  final dynamic id;
  final String productName;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  final String category;

  ProductModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category
  });

  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      productName: jsonData["title"],
      price: (jsonData["price"] as num).toDouble(),
      description: jsonData["description"],
      image: jsonData["image"],
      category: jsonData["category"],
      rating: RatingModel.fromjson(jsonData["rating"]),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(jsonData) {
    return RatingModel(
      rate: (jsonData["rate"] as num).toDouble(),
      count: jsonData["count"],
    );
  }
}

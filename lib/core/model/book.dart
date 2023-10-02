class Book {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  int? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  Book(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.stock,
      this.bestSeller,
      this.image,
      this.category});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'].toInt(),
      priceAfterDiscount: json['price_after_discount'] == null
          ? 0
          : json['price_after_discount'].toInt(),
      stock: json['stock'],
      bestSeller: json['best_seller'],
      image: json['image'],
      category: json['category'],
    );
  }
}

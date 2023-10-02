class Category {
  int id;
  String name;
  int productsCount;

  Category({required this.id, required this.name, required this.productsCount});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      productsCount: json['products_count'],
    );
  }
}

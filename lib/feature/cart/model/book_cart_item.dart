class BookCart {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  int? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  int? itemTotal;

  BookCart(
      {this.itemId,
      this.itemProductId,
      this.itemProductName,
      this.itemProductImage,
      this.itemProductPrice,
      this.itemProductDiscount,
      this.itemProductPriceAfterDiscount,
      this.itemProductStock,
      this.itemQuantity,
      this.itemTotal});

  factory BookCart.fromJson(Map<String, dynamic> json) {
    return BookCart(
      itemId: json['item_id'],
      itemProductId: json['item_product_id'],
      itemProductName: json['item_product_name'],
      itemProductImage: json['item_product_image'],
      itemProductPrice: json['item_product_price'],
      itemProductDiscount: json['item_product_discount'].toInt(),
      itemProductPriceAfterDiscount:
          json['item_product_price_after_discount'].toInt(),
      itemProductStock: json['item_product_stock'],
      itemQuantity: json['item_quantity'],
      itemTotal: json['item_total'].toInt(),
    );
  }
}

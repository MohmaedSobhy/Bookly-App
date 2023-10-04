class Order {
  int? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  Order({this.id, this.orderCode, this.orderDate, this.status, this.total});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderCode: json['order_code'],
      orderDate: json['order_date'],
      status: json['status'],
      total: json['total'],
    );
  }
}

import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/order%20history/model/order_history.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
        ),
        title: Text(
          order.orderDate!,
          style: const TextStyle(
            color: AppColor.darkBlue,
            fontSize: 25,
          ),
        ),
        subtitle: Text(
          "${order.total}\$",
          style: const TextStyle(
            color: AppColor.darkBlue,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

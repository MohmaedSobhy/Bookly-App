import 'package:books_app/feature/cart/model/book_cart_item.dart';
import 'package:flutter/material.dart';

class ReceiptItem extends StatelessWidget {
  final BookCart bookCart;
  const ReceiptItem({
    super.key,
    required this.bookCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ListTile(
          title: Text(
            bookCart.itemProductName!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity = ${bookCart.itemQuantity}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$${bookCart.itemTotal}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
                */
              

              
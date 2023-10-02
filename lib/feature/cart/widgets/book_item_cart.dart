import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/cart/model/book_cart_item.dart';
import 'package:flutter/material.dart';

class BookCartItem extends StatelessWidget {
  final BookCart book;
  final VoidCallback onDelete;
  final VoidCallback increment;
  final VoidCallback decrement;

  const BookCartItem({
    super.key,
    required this.book,
    required this.onDelete,
    required this.decrement,
    required this.increment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.23,
            height: MediaQuery.sizeOf(context).width * 0.25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(book.itemProductImage ?? ""),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.itemProductName ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.darkBlue,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                      ),
                      Text(
                        "${book.itemQuantity}",
                        style: const TextStyle(
                          color: AppColor.darkBlue,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: decrement,
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              Text(
                "\$ ${book.itemProductPrice}",
                style: const TextStyle(
                  color: AppColor.mainColor,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.01,
              ),
              Text(
                "\$ ${book.itemProductPriceAfterDiscount}",
                style: const TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

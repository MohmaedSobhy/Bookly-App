import 'package:books_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../model/book.dart';

class BookItem extends StatelessWidget {
  final VoidCallback addToFavourite;
  final VoidCallback addToCart;
  final Icon favouriteIcon;
  final Book book;
  final VoidCallback onTap;

  BookItem({
    super.key,
    required this.addToCart,
    required this.addToFavourite,
    required this.favouriteIcon,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.32,
              height: MediaQuery.sizeOf(context).height * 0.15,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(book.image ?? ""),
                  fit: BoxFit.cover,
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
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.name ?? '',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: const TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text(
                      book.category ?? " ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColor.darkBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$ ${book.price}",
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
                          "\$ ${book.priceAfterDiscount}",
                          style: const TextStyle(
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: addToFavourite,
                    icon: favouriteIcon,
                  ),
                  IconButton(
                    onPressed: addToCart,
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

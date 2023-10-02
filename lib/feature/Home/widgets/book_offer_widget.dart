import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/Home/widgets/discount_container.dart';
import 'package:flutter/material.dart';
import '../../../core/model/book.dart';

class BookOffer extends StatelessWidget {
  final Book book;
  final VoidCallback onPressed;
  const BookOffer({
    super.key,
    required this.book,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.sizeOf(context).width * 0.01,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GridTile(
                header: Row(
                  children: [
                    DiscountBox(
                      discount: book.discount,
                    ),
                  ],
                ),
                footer: Container(
                  color: Colors.black.withOpacity(0.6),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "\$${book.price}",
                        style: const TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${book.priceAfterDiscount}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColor.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${book.image}",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
(character.image == null)
              ? const CircularProgressIndicator(
                  color: AppColor.yellow,
                )
              : FadeInImage(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: const AssetImage("assets/images/loading.gif"),
                  fit: BoxFit.cover,
                  image: NetworkImage(character.image!),
                ),
 */
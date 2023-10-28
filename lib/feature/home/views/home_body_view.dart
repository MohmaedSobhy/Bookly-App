import 'package:books_app/core/localization/app_string.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/sized_box_high.dart';
import '../widgets/row_text_header.dart';
import 'best_saller_books_view.dart';
import 'categories_items.dart';
import 'image_slider.dart';
import 'new_arrival_view.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          SizedBoxHight(),
          ImageSlider(),
          TextHeader(title: AppString.categories),
          SizedBoxHight(),
          CategoriesView(),
          SizedBoxHight(),
          TextHeader(title: AppString.bestSaller),
          SizedBoxHight(),
          BestSallerBooksView(),
          SizedBoxHight(),
          TextHeader(title: AppString.newArrival),
          SizedBoxHight(),
          NewArrivalView(),
          SizedBoxHight(),
        ],
      ),
    );
  }
}

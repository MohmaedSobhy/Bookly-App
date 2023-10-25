import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/Home/controller/home_cubit.dart';
import 'package:books_app/feature/Home/controller/home_state.dart';
import 'package:books_app/feature/home/views/best_saller_books_view.dart';
import 'package:books_app/feature/home/views/categories_items.dart';
import 'package:books_app/feature/home/views/new_arrival_view.dart';
import 'package:books_app/feature/home/widgets/row_text_header.dart';
import 'package:books_app/feature/home/views/custome_app_bar_view.dart';
import 'package:books_app/feature/home/views/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            const CustomeAppBarView(),
            const SucessLoadData(),
          ],
        );
      },
    );
  }
}

class LoadingDataView extends StatelessWidget {
  const LoadingDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.green.shade300,
      highlightColor: Colors.green.shade100,
      enabled: true,
      child: Expanded(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                height: 12,
                width: 100,
                color: Colors.white,
              ),
              subtitle: Container(
                height: 8,
                width: 150,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

class SucessLoadData extends StatelessWidget {
  const SucessLoadData({super.key});

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

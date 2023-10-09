import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:books_app/feature/search/view/categories_filteration_view.dart';
import 'package:books_app/feature/search/view/slider_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterationView extends StatelessWidget {
  final VoidCallback onTap;
  const FilterationView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppString.filter,
                    style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColor.darkBlue.withOpacity(0.4),
                    child: IconButton(
                      onPressed: () {
                        SearchCubit.getInstanse(context).bottomSheetPop();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBoxHight(),
              const CategoriesFilterationView(),
              const SizedBoxHight(),
              const RangeSliderView(),
              const SizedBoxHight(),
              CustomButton(
                onTap: onTap,
                title: AppString.applyFilteration,
                width: double.infinity,
                backGroundColor: AppColor.darkBlue,
              )
            ],
          );
        },
      ),
    );
  }
}

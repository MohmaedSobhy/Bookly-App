import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/app_string.dart';
import '../../../core/theme/app_color.dart';

class RangeSliderView extends StatelessWidget {
  const RangeSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RangeSlider(
              values: SearchCubit.getInstanse(context).values,
              min: 0,
              max: 1000,
              onChanged: (value) {
                SearchCubit.getInstanse(context).rangeSlider(value);
              },
            ),
            const SizedBoxHight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppString.pirceRange,
                  style: TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${SearchCubit.getInstanse(context).min} EGP - ${SearchCubit.getInstanse(context).max} EGP",
                  style: const TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

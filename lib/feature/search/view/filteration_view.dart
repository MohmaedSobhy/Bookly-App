import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/core/widgets/sized_box_high.dart';
import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:books_app/feature/search/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterationView extends StatelessWidget {
  const FilterationView({super.key});

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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      SearchCubit.getInstanse(context).categoryies.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      onTap: () {
                        SearchCubit.getInstanse(context)
                            .changeButtonColor(index);
                      },
                      backGround:
                          SearchCubit.getInstanse(context).selectButton == index
                              ? AppColor.darkBlue
                              : null,
                      text: SearchCubit.getInstanse(context)
                          .categoryies[index]
                          .name,
                    );
                  },
                ),
              ),
              const SizedBoxHight(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.pirceRange,
                    style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "200 EGP - 500 EGP",
                    style: TextStyle(
                      color: AppColor.darkBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

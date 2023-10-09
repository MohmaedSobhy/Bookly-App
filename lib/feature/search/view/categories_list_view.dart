import 'package:books_app/feature/search/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: SearchCubit.getInstanse(context).categoryies.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                onTap: () {
                  SearchCubit.getInstanse(context).changeButtonColor(index);
                },
                backGround:
                    SearchCubit.getInstanse(context).selectButton == index
                        ? AppColor.darkBlue
                        : null,
                text: SearchCubit.getInstanse(context).categoryies[index].name,
              );
            },
          ),
        );
      },
    );
  }
}

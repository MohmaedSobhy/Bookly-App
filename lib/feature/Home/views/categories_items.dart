import 'package:books_app/feature/Home/controller/home_cubit.dart';
import 'package:books_app/feature/Home/controller/home_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.08,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HomeCubit.get(context).categories.length,
            itemBuilder: (_, index) {
              return CategoryItem(
                onTap: () {},
                title: HomeCubit.get(context).categories[index].name,
              );
            },
          ),
        );
      },
    );
  }
}

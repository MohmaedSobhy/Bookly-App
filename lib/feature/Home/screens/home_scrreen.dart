import 'package:books_app/feature/Home/controller/home_cubit.dart';
import 'package:books_app/feature/Home/controller/home_state.dart';
import 'package:books_app/feature/home/views/custome_app_bar_view.dart';
import 'package:books_app/feature/home/views/shimmer_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views/home_body_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        const CustomeAppBarView(),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is LoadData) {
              return const ShimmerHomeView();
            }
            return const ShimmerHomeView();
          },
        ),
      ],
    );
  }
}

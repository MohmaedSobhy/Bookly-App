import 'package:books_app/feature/Home/controller/home_cubit.dart';
import 'package:books_app/feature/Home/controller/home_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../core/routes/route_name.dart';
import '../widgets/book_offer_widget.dart';

class NewArrivalView extends StatelessWidget {
  const NewArrivalView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: ListView.builder(
            itemCount: HomeCubit.get(context).newArrival.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return BookOffer(
                book: HomeCubit.get(context).newArrival[index],
                onPressed: () {
                  Get.toNamed(
                    RoutesName.bookDetails,
                    arguments: HomeCubit.get(context).newArrival[index],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

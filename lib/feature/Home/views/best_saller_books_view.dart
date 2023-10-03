import 'package:books_app/feature/Home/controller/home_cubit.dart';
import 'package:books_app/feature/Home/controller/home_state.dart';
import 'package:books_app/feature/Home/widgets/book_offer_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSallerBooksView extends StatelessWidget {
  const BestSallerBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: ListView.builder(
            itemCount: HomeCubit.get(context).bestSaller.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return BookOffer(
                book: HomeCubit.get(context).bestSaller[index],
                onPressed: () {},
              );
            },
          ),
        );
      },
    );
  }
}

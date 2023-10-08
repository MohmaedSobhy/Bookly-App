import 'package:bloc/bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  static CategoryCubit? categoryCubit;

  static final Lock lock = Lock();

  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit getInstanse() {
    if (categoryCubit == null) {
      lock.synchronized(() {
        categoryCubit ??= CategoryCubit();
      });
    }
    return categoryCubit!;
  }

  void loadBookesCategory({required int id}) {}
}

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/feature/order%20history/controller/order_history_state.dart';
import 'package:books_app/feature/order%20history/model/order_history.dart';
import 'package:synchronized/synchronized.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  List<Order> orders = [];
  static OrderHistoryCubit? historyCubit;
  static final Lock lock = Lock();

  static OrderHistoryCubit getInstanse() {
    if (historyCubit == null) {
      lock.synchronized(() {
        historyCubit ??= OrderHistoryCubit();
      });
    }
    return historyCubit!;
  }

  void loadHistoryOrders() async {
    emit(LoadingHistoryOrders());
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    await APIManager.getMethod(baseUrl: EndPoints.orderHistory, token: token)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data[APIKey.data][APIKey.orders]) {
          orders.add(Order.fromJson(item));
        }
        emit(SucessLoadingHistory());
      } else {
        emit(FaildLoadHistory());
      }
    }).catchError((error) {
      emit(FaildLoadHistory());
    });
  }
}

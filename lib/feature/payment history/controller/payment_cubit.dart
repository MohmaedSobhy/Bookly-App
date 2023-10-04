import 'package:bloc/bloc.dart';
import 'package:books_app/feature/payment%20history/controller/payment_state.dart';
import 'package:meta/meta.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
}

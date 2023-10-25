import 'package:bloc/bloc.dart';
import 'package:synchronized/synchronized.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  static ResetPasswordCubit? resetPassword;
  static final Lock lock = Lock();

  String code = "";

  static ResetPasswordCubit getInstanse() {
    if (resetPassword == null) {
      lock.synchronized(() {
        resetPassword ??= ResetPasswordCubit();
      });
    }
    return resetPassword!;
  }

  ResetPasswordCubit() : super(ResetPasswordInitial());

  void resetUserPassword() {}
}

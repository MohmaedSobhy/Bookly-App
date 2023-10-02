import 'package:books_app/core/data/shared_date.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'setting_.state.dart';

class SettingCubit extends Cubit<SettingCubitState> {
  bool darkTheme = false;
  bool enableNotification = false;

  SettingCubit() : super(InitialStateSetting());

  static SettingCubit get(context) {
    return BlocProvider.of(context);
  }

  void enableDarkTheme() {
    darkTheme = !darkTheme;
    emit(DarkThemeState());
  }

  void enableNotificaiton() {
    enableNotification = !enableNotification;
    emit(NotificationColor());
  }

  void logoutMethod() {
    StorageHelper.deleteAllData();
    emit(LogoutState());
  }
}

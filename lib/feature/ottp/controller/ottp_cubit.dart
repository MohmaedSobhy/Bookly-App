import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synchronized/synchronized.dart';

import 'ottp_state.dart';

class OttpCubit extends Cubit<OttpState> {
  static OttpCubit? _ottpCubit;
  static final Lock _lock = Lock();
  TextEditingController pinController = TextEditingController();

  static OttpCubit get(context) {
    if (_ottpCubit == null) {
      _lock.synchronized(() {
        _ottpCubit ??= BlocProvider.of(context);
      });
    }
    return _ottpCubit!;
  }

  OttpCubit() : super(OttpInitial());

  void sendOttp() {}

  void resendCode() {}
}

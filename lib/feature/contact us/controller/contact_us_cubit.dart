import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/core/helper/show_toast_message.dart';
import 'package:books_app/feature/contact%20us/controller/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/localization/app_string.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  static ContactUsCubit? feedBackCubit;
  static final Lock lock = Lock();
  TextEditingController message = TextEditingController();
  TextEditingController subject = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static ContactUsCubit getInstanse() {
    if (feedBackCubit == null) {
      lock.synchronized(() {
        feedBackCubit ??= ContactUsCubit();
      });
    }
    return feedBackCubit!;
  }

  void sendMessageFeedBac() async {
    String token = '', email = '', name = '';

    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    await StorageHelper.getValue(key: APIKey.email).then((value) {
      email = value;
    });

    await StorageHelper.getValue(key: APIKey.name).then((value) {
      name = value;
    });

    APIManager.postMethod(baseUrl: EndPoints.contactus, token: token, body: {
      APIKey.name: name,
      APIKey.email: email,
      APIKey.subject: subject.text.toString(),
      APIKey.message: message.text.toString(),
    }).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        susessMessage();
      }
    }).catchError((error) {});
  }

  void susessMessage() {
    ShowToast.showMessage(
        message: AppString.sendFeedBackSucess, color: Colors.green);
    message.text = "";
    subject.text = "";
    emit(ContactSucess());
  }
}

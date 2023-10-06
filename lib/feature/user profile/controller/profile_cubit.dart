import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:books_app/core/localization/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:synchronized/synchronized.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool profileScreen = false;
  bool readOnly = true;
  List<String> cities = [];
  List<String> citiresId = [];
  String textButton = AppString.updateProfile;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  static ProfileCubit? profileCubit;
  File? imageProfile;
  static final Lock lock = Lock();

  static ProfileCubit getInstanse() {
    if (profileCubit == null) {
      lock.synchronized(() {
        profileCubit ??= ProfileCubit();
      });
    }
    return profileCubit!;
  }

  void loadingInfo() async {
    emit(LoadProfileInfo());
    profileScreen = true;
    readOnly = true;
    await Future.wait(
        [getPhone(), getAddres(), loadCities(), getName(), getEmail()]);

    if (cities.isNotEmpty) {
      emit(SucessLoadingProfileInfo());
    }
  }

  Future<void> loadCities() async {
    await APIManager.getMethod(baseUrl: EndPoints.governorates)
        .then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body);
        for (var item in data['data']) {
          cities.add(item['governorate_name_en']);
          citiresId.add(item['id']);
        }
      }
    }).catchError((error) {});
  }

  Future<void> getPhone() async {
    await StorageHelper.getValue(key: APIKey.phone).then((value) {
      phoneController.text = value;
    });
  }

  Future<void> getAddres() async {
    await StorageHelper.getValue(key: APIKey.address).then((value) {
      if (value != null) {
        addressController.text = value;
      }
    });
  }

  Future<void> getName() async {
    await StorageHelper.getValue(key: APIKey.name).then((value) {
      if (value != null) {
        nameController.text = value;
      }
    });
  }

  Future<void> getEmail() async {
    await StorageHelper.getValue(key: APIKey.email).then((value) {
      if (value != null) {
        emailController.text = value;
      }
    });
  }

  void _updateUserProfile() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });

    APIManager.postMethod(
            baseUrl: EndPoints.updateProfile,
            body: {
              APIKey.name: nameController.text.toString(),
              APIKey.phone: phoneController.text.toString(),
              APIKey.address: addressController.text.toLowerCase(),
            },
            token: token)
        .then(
      (response) async {
        if (response.statusCode == 200 || response.statusCode == 201) {
          await _saveChange();
          emit(ProfileUpdateSuccessfully());
        } else {}
      },
    ).catchError((error) {});
  }

  void updateButton() {
    if (profileScreen) {
      profileScreen = false;
      readOnly = false;
      textButton = AppString.save;
      emit(ProfileInitial());
    } else {
      _updateUserProfile();
    }
  }

  Future<void> _saveChange() async {
    profileScreen = false;
    readOnly = true;
    textButton = AppString.updateProfile;
    StorageHelper.addKey(key: APIKey.name, value: nameController.text);
    StorageHelper.addKey(key: APIKey.phone, value: phoneController.text);
    StorageHelper.addKey(key: APIKey.address, value: addressController.text);
  }

  void imagePicker() async {
    imageProfile = await _pickImage();
  }

  Future<File?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }
}

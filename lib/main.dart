import 'package:books_app/bloc_observal.dart';
import 'package:books_app/booky_app.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  StorageHelper.init();
  Bloc.observer = SimpleBlocObserval();
  runApp(const BookyApp());
}

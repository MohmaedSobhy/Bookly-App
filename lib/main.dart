import 'package:books_app/booky_app.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:flutter/material.dart';

void main() {
  StorageHelper.init();
  runApp(const BookyApp());
}

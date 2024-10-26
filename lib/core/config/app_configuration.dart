import 'package:flutter/material.dart';
import 'package:ui_example/core/data_source/dummy_api_data_source.dart';

class AppConfiguration with ChangeNotifier {
  final dummyApiDataSource = DummyApiDataSource();
}

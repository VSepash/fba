import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_example/core/data_source/dummy_api_data_source.dart';
import 'package:ui_example/core/model/product_model.dart';

enum LoadState {
  initial,
  loading,
  success,
  failure,
}

class ProductListState with ChangeNotifier {
  final DummyApiDataSource apiDataSource;

  List<ProductModel> productList = [];
  LoadState status = LoadState.initial;

  ProductListState({required this.apiDataSource});

  Future<void> fetchProductList() async {
    productList = [];
    status = LoadState.loading;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      final randomInt = Random().nextInt(100);
      if (randomInt % 5 == 0) {
        throw UnimplementedError('NETWORK ERROR');
      }

      productList = await apiDataSource.getProducts();
      status = LoadState.success;
    } catch (e) {
      print(e);
      productList = [];
      status = LoadState.failure;
    } finally {
      notifyListeners();
    }
  }
}

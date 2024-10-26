import 'package:dio/dio.dart';
import 'package:ui_example/core/model/product_model.dart';

abstract final class _DummyApiPath {
  static const String products = 'products';
}

class DummyApiDataSource {
  final Dio _client = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<List<ProductModel>> getProducts() async {
    final response = await _client.get(_DummyApiPath.products);
    final jsonData = response.data['products'] as List<dynamic>;
    final productList = jsonData.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
  }
}

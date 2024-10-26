import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_example/pages/home/data/product_list_state.dart';
import 'package:ui_example/pages/home/ui/widgets/product_widget.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final loadStatus = context.watch<ProductListState>().status;
    switch (loadStatus) {
      case LoadState.initial:
        return const Text('Initial state');
      case LoadState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LoadState.success:
        return Builder(builder: (context) {
          final productList = context.watch<ProductListState>().productList;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (_, index) {
                final product = productList[index];
                return ProductWidget(product: product);
              },
              itemCount: productList.length,
            ),
          );
        });
      case LoadState.failure:
        return const Center(
          child: Text('Возникла ошибка!'),
        );
    }
  }
}

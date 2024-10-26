import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_example/core/config/app_configuration.dart';
import 'package:ui_example/pages/home/data/product_list_state.dart';
import 'package:ui_example/pages/home/ui/widgets/product_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final state = ProductListState(
          apiDataSource: context.read<AppConfiguration>().dummyApiDataSource,
        );
        state.fetchProductList();
        return state;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Home page'),
            actions: [
              Builder(builder: (context) {
                final state = context.read<ProductListState>();
                return IconButton(
                    onPressed: state.fetchProductList,
                    icon: const Icon(Icons.replay));
              })
            ],
          ),
          body: const ProductListView()),
    );
  }
}

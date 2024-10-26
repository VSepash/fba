import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_example/core/config/app_configuration.dart';
import 'package:ui_example/pages/home/ui/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppConfiguration(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

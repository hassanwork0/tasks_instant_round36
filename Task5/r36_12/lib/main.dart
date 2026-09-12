import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products/core/routing/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  SharedPreferences sharedPreferences;
  MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Products',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router(sharedPreferences),
    );
  }
}

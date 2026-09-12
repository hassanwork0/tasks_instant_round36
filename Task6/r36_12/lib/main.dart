import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Job App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      builder: EasyLoading.init(),
    );
  }
}

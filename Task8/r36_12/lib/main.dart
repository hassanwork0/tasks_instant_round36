import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products/core/routing/router.dart';
import 'package:toastification/toastification.dart';

import 'core/bloc/my_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  SharedPreferences sharedPreferences;
  MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        title: 'Products',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router(sharedPreferences),
      
      ),
    );
  }
}

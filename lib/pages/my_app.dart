// lib/page/my_app.dart
import 'package:flutter/material.dart';
import 'package:test/apps/utils/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterCustom.router,
    );
  }
}

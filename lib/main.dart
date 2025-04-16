import 'package:flutter/material.dart';
import 'app_routers.dart';

void main() {
  runApp(MyApp(approuter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.approuter});
  final AppRouter approuter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: approuter.generateRoute,
    );
  }
}

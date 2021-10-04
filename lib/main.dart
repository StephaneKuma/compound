import 'package:compound/app/locator.dart';
import 'package:compound/app/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Compound',
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: _router.delegate(),
      builder: (context, router) => router!,
    );
  }
}

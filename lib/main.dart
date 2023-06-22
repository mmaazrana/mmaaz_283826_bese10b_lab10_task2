import 'package:flutter/material.dart';
import 'package:mmaaz_283826_bese10b_lab10_task2/pages/home.dart';
import 'package:mmaaz_283826_bese10b_lab10_task2/pages/login.dart';
import 'package:mmaaz_283826_bese10b_lab10_task2/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}

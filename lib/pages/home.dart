import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: logout,
      child: const Text(
        'Logout',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          fixedSize: const Size.fromWidth(150),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    ));
  }
}

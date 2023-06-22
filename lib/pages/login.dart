import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  bool _rememberMe = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool? isLoggedIn;

  void _validateForm() {
    String errorMessage = '';
    if (_emailController.text == '' || _passwordController.text == '') {
      errorMessage = 'Both Email and Password are required!';
    } else if (!_emailController.text.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      errorMessage = 'Enter valid Email address';
    } else if (_passwordController.text.length < 8) {
      errorMessage = 'Password should have at least 8 characters';
    } else if (!_passwordController.text.contains(RegExp(r'[A-Z]'))) {
      errorMessage = 'Password must contain an Upper-Case letter';
    } else if (!_passwordController.text.contains(RegExp(r'[0-9]'))) {
      errorMessage = 'Password must contain a Number';
    } else if (!_passwordController.text
        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errorMessage = 'Password must continer a Special Character';
    }

    if (errorMessage != '') {
      final snackBar = SnackBar(content: Text(errorMessage));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (_rememberMe) setPreferences();
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void setPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Image.network(
              'data:image/jpeg;base64,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'),
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(30),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined), hintText: 'Email'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: TextField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() => _passwordVisible = !_passwordVisible);
                  },
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                IconButton(
                    onPressed: () {
                      setState(() => _rememberMe = !_rememberMe);
                    },
                    icon: Icon(_rememberMe
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank)),
                const Text('Remember Me'),
              ]),
              const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blueAccent),
              )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: _validateForm,
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  fixedSize: const Size.fromWidth(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        )
      ],
    ));
  }
}

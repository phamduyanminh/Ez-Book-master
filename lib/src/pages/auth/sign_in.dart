import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/loginbloc/bloc/login_bloc.dart';
import '../../components/build_elevated_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-In"),
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          usernameField(),
          passwordField(),
        ],
      ),
    );
  }

  Widget usernameField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Username',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true, //* Has non showing text function
      decoration: const InputDecoration(
        icon: Icon(Icons.password),
        hintText: 'Password',
      ),
    );
  }
}

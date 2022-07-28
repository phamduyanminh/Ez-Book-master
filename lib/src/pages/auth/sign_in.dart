import 'package:flutter/material.dart';

import '../../components/build_elevated_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              "Sign In",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 30),
            Container(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter username",
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter password",
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            BuildElevatedButton(
              Icons.arrow_forward,
              "Submit",
              Colors.black,
              () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ez_book/src/components/build_elevated_button.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Settings"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter New Username",
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Username cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter New Password",
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    fontFamily: "Poppins",
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
        ),
      ),
    );
  }
}

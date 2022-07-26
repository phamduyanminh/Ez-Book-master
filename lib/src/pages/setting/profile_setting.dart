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
        padding: const EdgeInsets.all(30.0),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 50.0)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

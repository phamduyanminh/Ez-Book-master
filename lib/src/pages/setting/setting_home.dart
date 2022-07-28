import 'package:ez_book/src/pages/setting/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fontsizebloc/bloc/font_size_bloc.dart';

class SettingHome extends StatefulWidget {
  const SettingHome({Key? key}) : super(key: key);

  @override
  State<SettingHome> createState() => _SettingHomeState();
}

class _SettingHomeState extends State<SettingHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontSizeBloc, double>(
      builder: (context, state) {
        // if (state is BookLoaded) {
        return Scaffold(
          appBar: AppBar(title: const Text("User - Settings")),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 5, left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  elevation: 1,
                  child: SizedBox(
                    height: 80,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfileSetting(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            //! AppLocalizations.of(context).profile
                            "Profile",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 200),
                          Icon(Icons.mode_edit_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
                BlocBuilder<FontSizeBloc, double>(
                  builder: (context, state) {
                    return Card(
                      elevation: 1,
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              "Font Size",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 30),
                            Slider(
                              value: state,
                              max: 35,
                              divisions: 7,
                              label: state.round().toString(),
                              onChanged: (double value) {
                                context
                                    .read<FontSizeBloc>()
                                    .add(FontSizeChanged(value: value));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
        // }

        // return const Center(
        //   child: CircularProgressIndicator(),
        // );
      },
    );
  }
}

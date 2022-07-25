import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fontsizebloc/bloc/font_size_bloc.dart';
import '../../models/font_size.dart';

class SettingHome extends StatefulWidget {
  const SettingHome({Key? key}) : super(key: key);

  @override
  State<SettingHome> createState() => _SettingHomeState();
}

class _SettingHomeState extends State<SettingHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FontSizeBloc()..add(FontSizeChanged(15)),
      child: BlocBuilder<FontSizeBloc, double>(
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
                    child: InkWell(
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            BlocBuilder<FontSizeBloc, double>(
                              builder: (context, state) {
                                return Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: state,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 200),
                            const Icon(Icons.mode_edit_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
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
                              // currentSliderValue = value;
                              context
                                  .read<FontSizeBloc>()
                                  .add(FontSizeChanged(value));
                            },
                          ),
                        ],
                      ),
                    ),
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
      ),
    );
  }
}

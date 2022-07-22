import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fontsizebloc/bloc/font_size_bloc.dart';
import '../../blocs/homebloc/book_bloc.dart';

class SettingHome extends StatefulWidget {
  const SettingHome({Key? key}) : super(key: key);

  @override
  State<SettingHome> createState() => _SettingHomeState();
}

class _SettingHomeState extends State<SettingHome> {
  double currentSliderValue = 15;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FontSizeBloc()..add(FontSizeChanged(currentSliderValue)),
      child: BlocBuilder<FontSizeBloc, double>(
        builder: (context, state) {
          if (state is BookLoaded) {
            return Scaffold(
              appBar: AppBar(title: const Text("User - Settings")),
              body: Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 5, left: 5),
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
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                              SizedBox(width: 200),
                              Icon(Icons.mode_edit_rounded),
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
                            SizedBox(width: 10),
                            Text(
                              "Font Size",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(width: 20),
                            Slider(
                              value: currentSliderValue,
                              max: 35,
                              divisions: 7,
                              label: currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  currentSliderValue = value;
                                });
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
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

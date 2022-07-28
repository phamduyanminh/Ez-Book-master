import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/languagebloc/bloc/language_bloc.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({Key? key}) : super(key: key);

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(),
      child: BlocBuilder<LanguageBloc, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Language Setting"),
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              child: DropdownButton(
                value: state,
                items: const [
                  DropdownMenuItem(
                    child: Text("English"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Vietnamese"),
                    value: 2,
                  ),
                ],
                onChanged: (int? value) {
                  context
                      .read<LanguageBloc>()
                      .add(LanguageChanged(value: value!));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

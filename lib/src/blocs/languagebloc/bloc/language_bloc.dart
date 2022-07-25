import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, int> {
  LanguageBloc() : super(2) {
    on<LanguageChanged>((event, emit) {
      // TODO: implement event handler
      emit(event.value);
    });
  }
}

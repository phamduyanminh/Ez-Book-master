import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, double> {
  FontSizeBloc() : super(15) {
    on<FontSizeChanged>((event, emit) {
      // TODO: implement event handler
      emit(event.value);
    });
  }
}

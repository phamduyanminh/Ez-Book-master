import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, double> {
  FontSizeBloc() : super(20) {
    on<FontSizeChanged>((event, emit) {
      emit(event.value);
    });
  }
}

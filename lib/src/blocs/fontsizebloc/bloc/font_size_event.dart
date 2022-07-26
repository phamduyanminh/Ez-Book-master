part of 'font_size_bloc.dart';

abstract class FontSizeEvent extends Equatable {
  const FontSizeEvent();

  @override
  List<Object> get props => [];
}

class FontSizeChanged extends FontSizeEvent {
  final double value;
  const FontSizeChanged({required this.value});
  @override
  List<double> get props => [value];
}

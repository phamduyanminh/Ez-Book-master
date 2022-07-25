part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageChanged extends LanguageEvent {
  final int value;
  const LanguageChanged(this.value);
  @override
  List<int> get props => [value];
}

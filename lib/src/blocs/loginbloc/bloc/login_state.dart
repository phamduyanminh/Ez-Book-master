part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

//* Initial state of LoginForm
class LoginInitial extends LoginState {}

//* State of LoginForm when we're validating credentials
class LoginLoading extends LoginState {}

//* State of LoginForm when a login attemp has failed
class LoginFailure extends LoginState {
  final String error;
  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure {error: $error}';
}

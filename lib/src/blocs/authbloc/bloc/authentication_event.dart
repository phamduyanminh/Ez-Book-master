part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

//* Will be dispathced when the app first loads
class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'App started';
}

//* Will be dispatched on a successfully login
class LoggedIn extends AuthenticationEvent {
  final String token;
  LoggedIn({required this.token});

  @override
  String toString() => 'Logged in {token: $token}';
}

//* Will be dispathced on a successfully logout
class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'Logged out';
}

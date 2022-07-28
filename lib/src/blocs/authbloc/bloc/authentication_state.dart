part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

//* Waiting to see if the user is authenticated or not on app
class AuthenticationUninitialized extends AuthenticationState {}

//* Successfully authenticated
class AuthenticationAuthenticated extends AuthenticationState {}

//* Not authenticated
class AuthenticationUnauthenticated extends AuthenticationState {}

//* Waiting to persist/delete a token
class AuthenticationLoading extends AuthenticationState {}

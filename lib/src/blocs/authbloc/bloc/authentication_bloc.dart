import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../networks/repositories/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationUninitialized()) {
    // ignore: void_checks
    on<AuthenticationEvent>((event, emit) async* {
      if (event is AppStarted) {
        final bool hasToken = await userRepository.hasToken();
        if (hasToken) {
          yield AuthenticationAuthenticated();
        } else {
          yield AuthenticationUnauthenticated();
        }
      }

      if (event is LoggedIn) {
        yield AuthenticationLoading();
        await userRepository.persistToken(event.token);
        yield AuthenticationAuthenticated();
      }

      if (event is LoggedOut) {
        yield AuthenticationLoading();
        await userRepository.deleteToken();
        yield AuthenticationUnauthenticated();
      }
    });
  }
}

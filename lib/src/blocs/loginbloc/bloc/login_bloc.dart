import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../networks/repositories/user_repository.dart';
import '../../authbloc/bloc/authentication_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    // ignore: void_checks
    on<LoginEvent>((event, emit) async* {
      if (event is LoginButtonPressed) {
        yield LoginLoading();
        try {
          final token = await userRepository.authenticate(
            username: event.username,
            password: event.password,
          );
          // authenticationBloc.dispatch(LoggedIn(token: token));
          yield LoginInitial();
        } catch (error) {
          yield LoginFailure(error: error.toString());
        }
      }
    });
  }
}

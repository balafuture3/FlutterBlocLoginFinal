import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/auth/form_submission_status.dart';
import 'package:loginwithbloc/auth/login/login_event.dart';
import 'package:loginwithbloc/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc(this.authRepo) : super(LoginState(username: '', password: ''));
  //
  //
  // @override
  // Stream<void> onEvent(LoginEvent event) async* {
  //   if (event is LoginUsernameChanged) {
  //     // yield state.copyWith(username: event.username);
  //   } else if (event is LoginPasswordChanged) {
  //     // yield state.copyWith(password: event.password);
  //   } else if (event is LoginSubmitted) {
  //     yield state.copyWith(formstatus: FormSubmitting());
  //     try {
  //       await authRepo.login();
  //       yield state.copyWith(formstatus: SubmitSuccess());
  //     } on Exception catch (e) {
  //         yield state.copyWith(formstatus: SubmitFailed(e));
  //     }
  //   }
  //   // TODO: implement onEvent
  //   super.onEvent(event);
  // }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      print(event.username);
      yield state.copyWith(username: event.username);
    } else if (event is LoginPasswordChanged) {
      print(event.password);
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formstatus: FormSubmitting());
      try {
        await authRepo.login();
        yield state.copyWith(formstatus: SubmitSuccess());
      } on Exception catch (e) {
        print("dsfdsfds");
        yield state.copyWith(formstatus: SubmitFailed(e));
      }
    }
    // TODO: implement mapEventToState
    super.mapEventToState(event);
  }
}

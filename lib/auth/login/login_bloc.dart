import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/auth/form_submission_status.dart';
import 'package:loginwithbloc/auth/login/login_event.dart';
import 'package:loginwithbloc/auth/login/login_state.dart';

import 'Model/loginmodel.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

 late LoginModel liLogin;

  LoginBloc(this.authRepo) : super(LoginState(username: '', password: ''))
  {
    // TODO: No need registration of this bloc in Old Bloc
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginSubmitted>(_onSubmitted);

  }
  // TODO: Old Bloc Code
  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is LoginUsernameChanged) {
  //     print(event.username);
  //     yield state.copyWith(username: event.username);
  //   } else if (event is LoginPasswordChanged) {
  //     print(event.password);
  //     yield state.copyWith(password: event.password);
  //   } else if (event is LoginSubmitted) {
  //     yield state.copyWith(formstatus: FormSubmitting());
  //     try {
  //       await authRepo.login();
  //       yield state.copyWith(formstatus: SubmitSuccess());
  //     } on Exception catch (e) {
  //       print("dsfdsfds");
  //       yield state.copyWith(formstatus: SubmitFailed(e));
  //     }
  //   }
  //
  //   super.mapEventToState(event);
  // }

  FutureOr<void> _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onUsernameChanged(LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  Future<FutureOr<void>> _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formstatus: FormSubmitting()));
        try {
          await authRepo.LoginAPI(event.username,event.password).then((value)
          {
            if (value.statusCode == 200) {
              liLogin = LoginModel.fromJson(jsonDecode(value.body));

              print(liLogin.status);
              if (liLogin.status == 1) {
                emit(state.copyWith(formstatus: SubmitSuccess()));
                }
              else {
                emit( state.copyWith(formstatus: SubmitFailed( Exception("Failed"))));
              }

              // .cookie.split(';')[0]}");
            }
            // lilogin=LoginModel.fromJson(json.decode(value.body));
            // if (kDebugMode) {
            //   print("debug mode ${value}");
            //   print(lilogin.status);
            //
            // }
          });

        } on Exception catch (e) {
          emit( state.copyWith(formstatus: SubmitFailed(e)));
        }
  }
}

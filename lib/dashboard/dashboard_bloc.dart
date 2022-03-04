import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_event.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';

class DahboardBloc extends Bloc<DashboardEvent,DashboardState>
{

  DahboardBloc(this.authRepo) : super(DashboardState()){
    on<DashInit>(_dashInitMethod);
  }
  final AuthRepository authRepo;

  FutureOr<void> _dashInitMethod(DashInit event, Emitter<DashboardState> emit) {
    if (kDebugMode) {
      print("dasgh");
    }
    authRepo.login();

  }
}
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_event.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';
import 'package:loginwithbloc/dashboard/dashboard_status.dart';

class DahboardBloc extends Bloc<DashboardEvent,DashboardState>
{
  final AuthRepository authRepo;

  DahboardBloc(this.authRepo) : super(DashboardState(formstatus: const DashboardInital()))
  {
    on<DashInit>(_dashInitMethod);
  }


  FutureOr<void> _dashInitMethod(DashInit event, Emitter<DashboardState> emit) {
    if (kDebugMode) {
      print("dasgh");
    }
    authRepo.login();
    emit(state.copyWith(formstatus: DashSuccess()));

  }
}
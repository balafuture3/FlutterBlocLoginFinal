import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/dashboard/dash_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_event.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';
import 'package:loginwithbloc/dashboard/dashboard_status.dart';

class DahboardBloc extends Bloc<DashboardEvent,DashboardState>
{
  final DashRepository dashRepo;

  DahboardBloc(this.dashRepo) : super(DashboardState(formstatus:  DashboardInital()))
  {
    on<DashInit>(_dashInitMethod);
  }


  FutureOr<void> _dashInitMethod(DashInit event, Emitter<DashboardState> emit) {
    if (kDebugMode) {
      print("dasgh");
    }
    dashRepo.DahboardApi();
    emit(state.copyWith(formstatus: DashSuccess()));

  }
}
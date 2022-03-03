import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_event.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';

class DahboardBloc extends Bloc<DashboardEvent,DashboardState>
{

  DahboardBloc(DashboardState initialState, this.authRepo) : super(initialState){
    on<DashInit>(_dashInitMethod);
  }
  final AuthRepository authRepo;

  FutureOr<void> _dashInitMethod(DashInit event, Emitter<DashboardState> emit) {
    authRepo.login();

  }
}
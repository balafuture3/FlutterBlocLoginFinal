import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/auth/form_submission_status.dart';
import 'package:loginwithbloc/dashboard/dash_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_event.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';
import 'package:loginwithbloc/dashboard/dashboard_status.dart';

import 'Model/DashboardModel.dart';

class DahboardBloc extends Bloc<DashboardEvent,DashboardState>
{
  final DashRepository dashRepo;
  final String id;
  late  DashboardModel li;

  DahboardBloc(this.dashRepo,this.id) : super(DashboardState(formstatus:  DashboardInital(),dashboardModel: DashboardModel(status: 0,result: [])))
  {
    on<DashInit>(_dashInitMethod);
  }


  Future<FutureOr<void>> _dashInitMethod(DashInit event, Emitter<DashboardState> emit) async {
    if (kDebugMode) {
      print("dasgh");
    }
    emit(state.copyWith(formstatus: DashSubmitted(),dashboardModel: DashboardModel(status: 0,result: [])));
  await  dashRepo.DahboardApi(id).then((value)
    {
      li=DashboardModel.fromJson(jsonDecode(value.body));
      print("inside");
      print(json.encode(li));
          });
    emit(state.copyWith(formstatus:  DashSuccess(),dashboardModel: li));



  }
}
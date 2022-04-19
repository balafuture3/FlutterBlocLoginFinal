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
   DashboardModel li= DashboardModel(status: 0,result: []);
   DashboardModel li2= DashboardModel(status: 0,result: []);


  DahboardBloc(this.dashRepo,this.id) : super(DashboardState(formstatus:  DashboardInital(),dashboardModel: DashboardModel(status: 0,result: [])))
  {
    on<DashInit>(_dashInitMethod);
  }


  Future<FutureOr<void>> _dashInitMethod(DashInit event, Emitter<DashboardState> emit,) async {
    if (kDebugMode) {
      print("dasgh");
    }
    emit(state.copyWith(formstatus: DashSubmitted(),dashboardModel: DashboardModel(status: 0,result: [])));
   // await Future.delayed(Duration(seconds: 3));
  await  dashRepo.DahboardApi(id,(int.parse(event.offset)-1)*20).then((value)
    {
// li.result?.clear();
    if(li.result!.isEmpty) {
      li=DashboardModel.fromJson(jsonDecode(value.body));
    } else {
      li2=DashboardModel.fromJson(jsonDecode(value.body));
      for(int i=0;i<li2.result!.length;i++) {
        li.result?.add(li2.result![i]);
      }
    }
      print("inside");
      // print(page);
      print(json.encode(li));
          });
    emit(state.copyWith(dashboardModel: li,formstatus: DashSuccess(),));



  }
}
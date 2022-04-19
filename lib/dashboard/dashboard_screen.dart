import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/auth/login/login_bloc.dart';
import 'package:loginwithbloc/auth/login/login_event.dart';
import 'package:loginwithbloc/dashboard/dash_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_bloc.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';

import 'dashboard_event.dart';
import 'dashboard_status.dart';

class Dashboard extends StatefulWidget {
   Dashboard({Key? key , required this.id}) : super(key: key);
   String id;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int cnt=2;
  late DahboardBloc dahboardBloc ;
  late ScrollController controller;
  void _scrollListener() {

    if (controller.position.pixels ==
        controller.position.maxScrollExtent) {
      dahboardBloc.add( DashInit(widget.id,cnt.toString()));
      print("sdfdsf");
cnt++;
    }
  }
  @override
  void initState() {
    controller =  ScrollController()..addListener(_scrollListener);
    dahboardBloc = DahboardBloc(DashRepository(), widget.id)..add(DashInit(widget.id, "1"));
if (kDebugMode) {
  print("id${widget.id}");
}
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<DahboardBloc>().add(DashInit());
    // dahboardBloc.stream.listen((state) {
    //   if (state is DashInit) {
    //
    //     print('listening to bloc');
    //   }
    // });

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"),),
      body:BlocProvider(

    create: (context) => DahboardBloc(context.read<DashRepository>(),widget.id)..add(DashInit(widget.id,"1")),
    child:BlocBuilder<DahboardBloc,DashboardState>(
      bloc: dahboardBloc,
      // bloc: DahboardBloc(DashRepository(),widget.id),
        builder: (context, state) {
          return state.formstatus is DashboardInital?const Center(child:  CircularProgressIndicator(),):state.formstatus is DashSubmitted ?const Center(child:   CupertinoActivityIndicator(),):
          ListView.builder(
            itemCount: state.dashboardModel.result!.length,
            controller: controller,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  onTap: (){
                    dahboardBloc.add( DashInit(widget.id,cnt.toString()));
                    print(state.dashboardModel.result![i].cUSNAME.toString());
                  },
                  title: Text(state.dashboardModel.result![i].cUSNAME.toString()),subtitle: Text(state.dashboardModel.result![i].dOCNO.toString()),);

          },

          );
        }
    )));

  }
}

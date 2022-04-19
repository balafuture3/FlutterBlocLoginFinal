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
  late DahboardBloc dahboardBloc;

  @override
  void initState() {
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

    create: (context) => DahboardBloc(context.read<DashRepository>())..add(DashInit()),
    child:BlocBuilder<DahboardBloc,DashboardState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      context.read<DahboardBloc>().add(DashInit());
                    },
                    child: Text("Test"))
              ],
            ),
          );
        }
    )));

  }
}

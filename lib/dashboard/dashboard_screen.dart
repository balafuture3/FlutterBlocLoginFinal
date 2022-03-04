import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/auth/login/login_bloc.dart';
import 'package:loginwithbloc/auth/login/login_event.dart';
import 'package:loginwithbloc/dashboard/dashboard_bloc.dart';
import 'package:loginwithbloc/dashboard/dashboard_state.dart';

import 'dashboard_event.dart';
import 'dashboard_status.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late DahboardBloc dahboardBloc;

  @override
  void initState() {
    // dahboardBloc = BlocProvider.of<DahboardBloc>(context);
    // dahboardBloc.stream.listen((state) {
    //   if (state is DashInit) {
    //
    //     print('listening to bloc');
    //   }
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"),),
      body:BlocProvider(
    create: (context) { return DahboardBloc(context.read<AuthRepository>())..add(DashInit());},
    child: SingleChildScrollView(
            child: Column(
              children: const [
                Text("Test")
              ],
            ),
          ),
    ));

  }
}

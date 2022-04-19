import 'package:loginwithbloc/dashboard/Model/DashboardModel.dart';

import 'dashboard_status.dart';

class DashboardState
{
  final DashBoardStatus  formstatus;
  final DashboardModel dashboardModel;
  DashboardState( { required this.formstatus,required this.dashboardModel});
  DashboardState copyWith({
  required formstatus,
    required DashboardModel  dashboardModel
  })
  {
    return DashboardState(
        formstatus: formstatus, dashboardModel: dashboardModel,

    );
  }

}

import 'package:loginwithbloc/dashboard/Model/DashboardModel.dart';

import 'dashboard_status.dart';

class DashboardState
{
  final DashBoardStatus  formstatus;
  final DashboardModel dashboardModel;
  DashboardState( { this.formstatus= const DashboardInital(),required this.dashboardModel});
  DashboardState copyWith({
  DashBoardStatus formstatus =const DashboardInital(),
    required DashboardModel  dashboardModel
  })
  {
    return DashboardState(
        formstatus: formstatus, dashboardModel: dashboardModel,

    );
  }

}

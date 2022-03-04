import 'dashboard_status.dart';

class DashboardState
{
  final DashBoardStatus  formstatus;
  DashboardState({ this.formstatus= const DashboardInital()});
  DashboardState copyWith({
  DashBoardStatus formstatus =const DashboardInital()
  })
  {
    return DashboardState(
        formstatus: formstatus
    );
  }

}

abstract class DashBoardStatus {
  const DashBoardStatus();
}

class DashboardInital extends DashBoardStatus {
  const DashboardInital();
}
class DashSubmitted extends DashBoardStatus {

}
class DashSuccess extends DashBoardStatus {

}

class DashFailed extends DashBoardStatus {
  final Exception exception;
  DashFailed(this.exception);
}

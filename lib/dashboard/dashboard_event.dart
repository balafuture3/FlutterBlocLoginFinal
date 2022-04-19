abstract class DashboardEvent
{

}
class DashInit extends DashboardEvent
{
  String id;
  String offset;
DashInit(this.id,this.offset);
}
class LoginModel {
  int? status;
  String? branchid;
  String? branchname;
  int? userid;
  int? superuser;
  String? approval;
  String? empcode;
  String? empname;

  LoginModel(
      {this.status,
        this.branchid,
        this.branchname,
        this.userid,
        this.superuser,
        this.approval,
        this.empcode,
        this.empname});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    branchid = json['branchid'];
    branchname = json['branchname'];
    userid = json['userid'];
    superuser = json['superuser'];
    approval = json['approval'];
    empcode = json['empcode'];
    empname = json['empname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['branchid'] = this.branchid;
    data['branchname'] = this.branchname;
    data['userid'] = this.userid;
    data['superuser'] = this.superuser;
    data['approval'] = this.approval;
    data['empcode'] = this.empcode;
    data['empname'] = this.empname;
    return data;
  }
}
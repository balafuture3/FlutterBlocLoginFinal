class DashboardModel {
  int? status;
  List<Result>? result;

  DashboardModel({this.status, this.result});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? tOTAL;
  int? dOCNO;
  String? dOCDATE;
  String? mOBILENUMBER;
  String? cUSNAME;
  String? eMPLOYEE;
  int? sTATUS;
  String? rEASON;
  String? qUOTTYPE;
  int? cREADTEDBY;
  String? cREATEDDATE;
  Null? mODIFIEDDATE;
  String? tOTAL2;
  String? gRANDTOTAL;
  String? tRCHARGES;
  String? lOCHARGES;
  Null? iNSCHARGES;
  String? cARDCODE;
  String? cUSCODE;

  Result(
      {this.tOTAL,
        this.dOCNO,
        this.dOCDATE,
        this.mOBILENUMBER,
        this.cUSNAME,
        this.eMPLOYEE,
        this.sTATUS,
        this.rEASON,
        this.qUOTTYPE,
        this.cREADTEDBY,
        this.cREATEDDATE,
        this.mODIFIEDDATE,
        this.tOTAL2,
        this.gRANDTOTAL,
        this.tRCHARGES,
        this.lOCHARGES,
        this.iNSCHARGES,
        this.cARDCODE,
        this.cUSCODE});

  Result.fromJson(Map<String, dynamic> json) {
    tOTAL = json['TOTAL'];
    dOCNO = json['DOCNO'];
    dOCDATE = json['DOCDATE'];
    mOBILENUMBER = json['MOBILENUMBER'];
    cUSNAME = json['CUSNAME'];
    eMPLOYEE = json['EMPLOYEE'];
    sTATUS = json['STATUS'];
    rEASON = json['REASON'];
    qUOTTYPE = json['QUOT_TYPE'];
    cREADTEDBY = json['CREADTEDBY'];
    cREATEDDATE = json['CREATEDDATE'];
    mODIFIEDDATE = json['MODIFIEDDATE'];
    tOTAL2 = json['TOTAL:2'];
    gRANDTOTAL = json['GRANDTOTAL'];
    tRCHARGES = json['TRCHARGES'];
    lOCHARGES = json['LOCHARGES'];
    iNSCHARGES = json['INSCHARGES'];
    cARDCODE = json['CARDCODE'];
    cUSCODE = json['CUSCODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TOTAL'] = this.tOTAL;
    data['DOCNO'] = this.dOCNO;
    data['DOCDATE'] = this.dOCDATE;
    data['MOBILENUMBER'] = this.mOBILENUMBER;
    data['CUSNAME'] = this.cUSNAME;
    data['EMPLOYEE'] = this.eMPLOYEE;
    data['STATUS'] = this.sTATUS;
    data['REASON'] = this.rEASON;
    data['QUOT_TYPE'] = this.qUOTTYPE;
    data['CREADTEDBY'] = this.cREADTEDBY;
    data['CREATEDDATE'] = this.cREATEDDATE;
    data['MODIFIEDDATE'] = this.mODIFIEDDATE;
    data['TOTAL:2'] = this.tOTAL2;
    data['GRANDTOTAL'] = this.gRANDTOTAL;
    data['TRCHARGES'] = this.tRCHARGES;
    data['LOCHARGES'] = this.lOCHARGES;
    data['INSCHARGES'] = this.iNSCHARGES;
    data['CARDCODE'] = this.cARDCODE;
    data['CUSCODE'] = this.cUSCODE;
    return data;
  }
}
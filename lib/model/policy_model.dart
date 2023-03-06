class PolicyModel {
  int? docnum;
  String? policyDate;
  int? day;
  int? dailyPrice;
  int? monthlyPrice;

  PolicyModel(
      {this.docnum,
      this.policyDate,
      this.day,
      this.dailyPrice,
      this.monthlyPrice});

  PolicyModel.fromJson(Map<dynamic, dynamic> json) {
    docnum = json['docnum'];
    policyDate = json['policyDate'];
    day = json['day'];
    dailyPrice = json['dailyPrice'];
    monthlyPrice = json['monthlyPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docnum'] = this.docnum;
    data['policyDate'] = this.policyDate;
    data['day'] = this.day;
    data['dailyPrice'] = this.dailyPrice;
    data['monthlyPrice'] = this.monthlyPrice;
    return data;
  }
}

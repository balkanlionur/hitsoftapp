class UserModel {
  int? docnum;
  String? cardName;
  String? cardLastName;
  int? polciyNum;
  String? policyBegDate;
  int? installmentNo;
  String? policyEndDate;
  String? comments;
  int? methodology;

  UserModel(
      {this.docnum,
      this.cardName,
      this.cardLastName,
      this.polciyNum,
      this.policyBegDate,
      this.installmentNo,
      this.policyEndDate,
      this.comments,
      this.methodology});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    docnum = json['docnum'];
    cardName = json['cardName'];
    cardLastName = json['cardLastName'];
    polciyNum = json['polciyNum'];
    policyBegDate = json['policyBegDate'];
    installmentNo = json['installmentNo'];
    policyEndDate = json['policyEndDate'];
    comments = json['comments'];
    methodology = json['methodology'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docnum'] = this.docnum;
    data['cardName'] = this.cardName;
    data['cardLastName'] = this.cardLastName;
    data['polciyNum'] = this.polciyNum;
    data['policyBegDate'] = this.policyBegDate;
    data['installmentNo'] = this.installmentNo;
    data['policyEndDate'] = this.policyEndDate;
    data['comments'] = this.comments;
    data['methodology'] = this.methodology;
    return data;
  }
}

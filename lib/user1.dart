class user1 {
  String? id;
  String? date;
  String? type;
  String? amount;
  String? reason;
  String? ac;

  user1({this.id, this.date, this.type, this.amount, this.reason, this.ac});

  user1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    type = json['type'];
    amount = json['amount'];
    reason = json['reason'];
    ac = json['ac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['reason'] = this.reason;
    data['ac'] = this.ac;
    return data;
  }
}
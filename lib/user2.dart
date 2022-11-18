class user2 {
  String? id;
  String? name;
  String? date;
  String? type;
  String? amount;
  String? reason;
  String? ac;

  user2(
      {this.id,
        this.name,
        this.date,
        this.type,
        this.amount,
        this.reason,
        this.ac});

  user2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    type = json['type'];
    amount = json['amount'];
    reason = json['reason'];
    ac = json['ac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['reason'] = this.reason;
    data['ac'] = this.ac;
    return data;
  }
}
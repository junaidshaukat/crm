class AccountType {
  num id;
  String name;
  dynamic value;

  AccountType({required this.id, required this.name, this.value});

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return AccountType(
      id: json['id'],
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }
}

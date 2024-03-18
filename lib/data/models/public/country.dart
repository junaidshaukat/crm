class CountryReq {}

class CountryRes {
  List<CountryData>? data;

  CountryRes({this.data});

  CountryRes.fromJson(dynamic json) {
    data = json != null
        ? (json as List<dynamic>)
            .map((data) => CountryData.fromJson(data))
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final temp = <String, dynamic>{};

    if (data != null) {
      temp['data'] = data?.map((data) => data.toJson()).toList();
    }
    return temp;
  }
}

class CountryData {
  String? name;
  String? code;

  CountryData({this.name, this.code});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(name: json['name'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
}

class CountryStateReq {
  String? countryCode;

  CountryStateReq({this.countryCode});

  CountryStateReq.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
  }

  Map<String, String> toJson() {
    final data = <String, String>{};
    if (countryCode != null) {
      data['countryCode'] = countryCode!;
    }

    return data;
  }
}

class CountryStateRes {
  List<CountrySatesData>? data;

  CountryStateRes({
    this.data,
  });

  CountryStateRes.fromJson(dynamic json) {
    data = json != null
        ? (json as List<dynamic>)
            .map((data) => CountrySatesData.fromJson(data))
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

class CountrySatesData {
  String? name;
  String? code;

  CountrySatesData({this.name, this.code});

  factory CountrySatesData.fromJson(Map<String, dynamic> json) {
    return CountrySatesData(name: json['name'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
    };
  }
}

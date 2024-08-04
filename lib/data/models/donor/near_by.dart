import '/core/app_export.dart';

class NearByReq {
  num? radius;
  num? latitude;
  num? longitude;
  String? postalZipCode;

  NearByReq({
    this.radius,
    this.latitude,
    this.longitude,
    this.postalZipCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'radius': radius,
      'latitude': latitude,
      'longitude': longitude,
      'postalZipCode': postalZipCode,
    };
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class NearByRes {
  bool result;
  String message;
  List<DonorData> data;
  MessageDetails messageDetails;

  NearByRes({
    this.message = '',
    this.result = false,
    this.data = const [],
    required this.messageDetails,
  });

  factory NearByRes.fromJson(Map<String, dynamic> json) {
    List<DonorData> donorDataList = [];
    if (json['data'] != null) {
      json['data'].forEach((donorData) {
        donorDataList.add(DonorData.fromJson(donorData));
      });
    }

    return NearByRes(
      data: donorDataList,
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
    );
  }
}

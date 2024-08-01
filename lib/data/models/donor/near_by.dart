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
  final bool result;
  final String message;
  final List<String> messageDetails;
  final DonorLinks links;
  final List<DonorData> data;

  NearByRes({
    required this.result,
    required this.message,
    required this.messageDetails,
    required this.links,
    required this.data,
  });

  factory NearByRes.fromJson(Map<String, dynamic> json) {
    List<DonorData> donorDataList = [];
    if (json['data'] != null) {
      json['data'].forEach((donorData) {
        donorDataList.add(DonorData.fromJson(donorData));
      });
    }

    return NearByRes(
      result: json['result'],
      message: json['message'],
      messageDetails: List<String>.from(json['messageDetails']),
      links: DonorLinks.fromJson(json['links']),
      data: donorDataList,
    );
  }
}

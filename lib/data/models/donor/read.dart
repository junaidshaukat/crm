class DonorReadReq {
  int? page;
  int? pageSize;
  String? by;
  String? order;

  DonorReadReq({
    this.page = 1,
    this.pageSize = 10,
    this.by,
    this.order = 'asc',
  });

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};
    if (page != null) {
      temp['page'] = page;
    }
    if (pageSize != null) {
      temp['pageSize'] = pageSize;
    }
    if (by != null) {
      temp['by'] = by;
    }
    if (order != null) {
      temp['order'] = order;
    }

    if (filter != null) {
      temp.addAll(filter);
    }

    return temp;
  }

  String toQueryString() {
    return toJson()
        .entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${e.value}')
        .join('&');
  }
}

class DonorReadRes {
  final bool result;
  final String message;
  final List<String> messageDetails;
  final DonorLinks links;
  final List<DonorData> data;

  DonorReadRes({
    required this.result,
    required this.message,
    required this.messageDetails,
    required this.links,
    required this.data,
  });

  factory DonorReadRes.fromJson(Map<String, dynamic> json) {
    List<DonorData> donorDataList = [];
    if (json['data'] != null) {
      json['data'].forEach((donorData) {
        donorDataList.add(DonorData.fromJson(donorData));
      });
    }

    return DonorReadRes(
      result: json['result'],
      message: json['message'],
      messageDetails: List<String>.from(json['messageDetails']),
      links: DonorLinks.fromJson(json['links']),
      data: donorDataList,
    );
  }
}

class DonorLinks {
  num? total;
  num? count;
  num? perPage;
  num? currentPage;
  num? lastPage;
  String? firstPageUrl;
  String? lastPageUrl;
  String? nextPageUrl;
  String? previousPageUrl;
  num? from;
  num? to;

  DonorLinks({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
    this.from,
    this.to,
  });

  factory DonorLinks.fromJson(Map<String, dynamic> json) {
    return DonorLinks(
      total: json['total'],
      count: json['count'],
      perPage: json['perPage'],
      currentPage: json['currentPage'],
      lastPage: json['lastPage'],
      firstPageUrl: json['firstPageUrl'],
      lastPageUrl: json['lastPageUrl'],
      nextPageUrl: json['nextPageUrl'],
      previousPageUrl: json['previousPageUrl'],
      from: json['from'],
      to: json['to'],
    );
  }
}

class DonorData {
  num? tagNumber;
  String? firstName;
  String? middleName;
  String? lastName;
  String? streetAddress;
  dynamic unitNumber;
  dynamic accountPassword;
  String? city;
  String? postalZipCode;
  String? provinceState;
  String? country;
  String? email;
  dynamic phone;
  num? status;
  dynamic lastLogin;
  num? allowContact;
  num? notifyNewCampaign;
  String? createDateTime;
  String? updateDateTime;

  DonorData({
    this.tagNumber,
    this.firstName,
    this.middleName,
    this.lastName,
    this.streetAddress,
    this.unitNumber,
    this.city,
    this.postalZipCode,
    this.provinceState,
    this.country,
    this.email,
    this.accountPassword,
    this.phone,
    this.status,
    this.lastLogin,
    this.allowContact,
    this.notifyNewCampaign,
    this.createDateTime,
    this.updateDateTime,
  });

  factory DonorData.fromJson(Map<String, dynamic> json) {
    return DonorData(
      tagNumber: json['tagNumber'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      streetAddress: json['streetAddress'],
      unitNumber: json['unitNumber'],
      city: json['city'],
      postalZipCode: json['postalZipCode'],
      provinceState: json['provinceState'],
      country: json['country'],
      email: json['email'],
      accountPassword: json['accountPassword'],
      phone: json['phone'],
      status: json['status'],
      lastLogin: json['lastLogin'],
      allowContact: json['allowContact'],
      notifyNewCampaign: json['notifyNewCampaign'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
    );
  }
}

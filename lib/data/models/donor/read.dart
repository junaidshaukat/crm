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

  Map<String, dynamic> toJson(
      {Map<String, String>? filter, Map<String, List>? query}) {
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

    if (query != null) {
      temp.addAll(query);
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
    this.total = 0,
    this.count = 0,
    this.perPage = 0,
    this.currentPage = 0,
    this.lastPage = 0,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
    this.from = 0,
    this.to = 0,
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
  String? accountType;
  String? businessName;
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
  num? distance;
  num? status;
  dynamic lastLogin;
  num? allowContact;
  num? notifyNewCampaign;
  String? profileImage;
  String? createDateTime;
  String? updateDateTime;

  DonorData({
    this.tagNumber,
    this.accountType,
    this.businessName,
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
    this.distance = 0,
    this.accountPassword,
    this.phone,
    this.status,
    this.lastLogin,
    this.allowContact,
    this.notifyNewCampaign,
    this.profileImage,
    this.createDateTime,
    this.updateDateTime,
  });

  factory DonorData.fromJson(Map<String, dynamic> json) {
    return DonorData(
      tagNumber: json['tagNumber'],
      accountType: json['accountType'],
      businessName: json['businessName'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      streetAddress: json['streetAddress'],
      unitNumber: json['unitNumber'],
      city: json['city'],
      distance: json['distance'] ?? 0,
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
      profileImage: json['profileImage'],
      createDateTime: json['createDateTime'],
      updateDateTime: json['updateDateTime'],
    );
  }
}

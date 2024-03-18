import '/core/app_export.dart';

class OrganizationRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  OrganizationData? data;

  OrganizationRes(
      {this.instanceId,
      this.result,
      this.message,
      this.messageDetails,
      this.data});

  OrganizationRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data =
        json['data'] != null ? OrganizationData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['instanceId'] = instanceId;
    json['result'] = result;
    json['message'] = message;
    json['messageDetails'] = messageDetails;
    if (data != null) {
      json['data'] = data?.toJson();
    }
    return json;
  }
}

class OrganizationData {
  int? tagNumber;
  String? name;
  String? logo;
  String? streetAddress;
  String? unitNumber;
  String? city;
  String? provinceState;
  String? postalZipCode;
  String? country;
  String? phone;
  String? website;
  String? email;
  String? footerNote;
  String? charityOrganization;
  String? charityStreetAddress;
  dynamic charityUnitNumber;
  String? charityCity;
  String? charityProvinceState;
  String? charityPostalZipCode;
  String? charityRegistrationNumber;
  String? taxReceiptFooter;
  String? generateSignature;
  String? signatureImage;
  String? signatureImageType;
  String? contactName;
  String? contactPhone;
  String? contactEmail;
  String? signupDate;
  String? timezone;
  String? locationName;
  String? shortName;
  String? taxReceiptStartDate;
  String? receiptFooter;
  dynamic receiptAlertEmail;
  String? portalUrl;
  String? forceRegistration;
  String? createDateTime;
  String? updateDateTime;
  String? signatureImageBytes;

  OrganizationData(
      {this.tagNumber,
      this.name,
      this.logo,
      this.streetAddress,
      this.unitNumber,
      this.city,
      this.provinceState,
      this.postalZipCode,
      this.country,
      this.phone,
      this.website,
      this.email,
      this.footerNote,
      this.charityOrganization,
      this.charityStreetAddress,
      this.charityUnitNumber,
      this.charityCity,
      this.charityProvinceState,
      this.charityPostalZipCode,
      this.charityRegistrationNumber,
      this.taxReceiptFooter,
      this.generateSignature,
      this.signatureImage,
      this.signatureImageType,
      this.contactName,
      this.contactPhone,
      this.contactEmail,
      this.signupDate,
      this.timezone,
      this.locationName,
      this.shortName,
      this.taxReceiptStartDate,
      this.receiptFooter,
      this.receiptAlertEmail,
      this.portalUrl,
      this.forceRegistration,
      this.createDateTime,
      this.updateDateTime,
      this.signatureImageBytes});

  OrganizationData.fromJson(Map<String, dynamic> json) {
    tagNumber = json['tagNumber'];
    name = json['name'];
    logo = json['logo'];
    streetAddress = json['streetAddress'];
    unitNumber = json['unitNumber'];
    city = json['city'];
    provinceState = json['provinceState'];
    postalZipCode = json['postalZipCode'];
    country = json['country'];
    phone = json['phone'];
    website = json['website'];
    email = json['email'];
    footerNote = json['footerNote'];
    charityOrganization = json['charityOrganization'];
    charityStreetAddress = json['charityStreetAddress'];
    charityUnitNumber = json['charityUnitNumber'];
    charityCity = json['charityCity'];
    charityProvinceState = json['charityProvinceState'];
    charityPostalZipCode = json['charityPostalZipCode'];
    charityRegistrationNumber = json['charityRegistrationNumber'];
    taxReceiptFooter = json['taxReceiptFooter'];
    generateSignature = json['generateSignature'];
    signatureImage = json['signatureImage'];
    signatureImageType = json['signatureImageType'];
    contactName = json['contactName'];
    contactPhone = json['contactPhone'];
    contactEmail = json['contactEmail'];
    signupDate = json['signupDate'];
    timezone = json['timezone'];
    locationName = json['locationName'];
    shortName = json['shortName'];
    taxReceiptStartDate = json['taxReceiptStartDate'];
    receiptFooter = json['receiptFooter'];
    receiptAlertEmail = json['receiptAlertEmail'];
    portalUrl = json['portalUrl'];
    forceRegistration = json['forceRegistration'];
    createDateTime = json['createDateTime'];
    updateDateTime = json['updateDateTime'];
    signatureImageBytes = json['signatureImageBytes'];
  }

  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'name': name,
      'logo': logo,
      'streetAddress': streetAddress,
      'unitNumber': unitNumber,
      'city': city,
      'provinceState': provinceState,
      'postalZipCode': postalZipCode,
      'country': country,
      'phone': phone,
      'website': website,
      'email': email,
      'footerNote': footerNote,
      'charityOrganization': charityOrganization,
      'charityStreetAddress': charityStreetAddress,
      'charityUnitNumber': charityUnitNumber,
      'charityCity': charityCity,
      'charityProvinceState': charityProvinceState,
      'charityPostalZipCode': charityPostalZipCode,
      'charityRegistrationNumber': charityRegistrationNumber,
      'taxReceiptFooter': taxReceiptFooter,
      'generateSignature': generateSignature,
      'signatureImage': signatureImage,
      'signatureImageType': signatureImageType,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'contactEmail': contactEmail,
      'signupDate': signupDate,
      'timezone': timezone,
      'locationName': locationName,
      'shortName': shortName,
      'taxReceiptStartDate': taxReceiptStartDate,
      'receiptFooter': receiptFooter,
      'receiptAlertEmail': receiptAlertEmail,
      'portalUrl': portalUrl,
      'forceRegistration': forceRegistration,
      'createDateTime': createDateTime,
      'updateDateTime': updateDateTime,
      'signatureImageBytes': signatureImageBytes,
    };
  }
}

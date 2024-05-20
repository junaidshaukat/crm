class MessageDetails {
  String? details;
  MessageDetails({this.details});

  factory MessageDetails.fromJson(dynamic data) {
    if (data is String) {
      return MessageDetails(details: data);
    } else if (data is List) {
      return MessageDetails(details: data.join(', '));
    } else if (data is Map) {
      return MessageDetails(details: data.values.join());
    } else {
      return MessageDetails(details: "Invalid Message Details");
    }
  }
}

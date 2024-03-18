import '/core/app_export.dart';

class ThisYearTransactionsReq {
  ThisYearTransactionsReq();

  ThisYearTransactionsReq.fromJson(Map<String, dynamic> json) {
    ThisYearTransactionsReq();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}

class ThisYearTransactionsRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  ThisYearTransactions? data;

  ThisYearTransactionsRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  ThisYearTransactionsRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? ThisYearTransactions.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (instanceId != null) {
      data['instanceId'] = instanceId;
    }
    if (result != null) {
      data['result'] = result;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (messageDetails != null) {
      data['messageDetails'] = messageDetails;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class ThisYearTransactions {
  num? total;

  ThisYearTransactions({this.total});

  ThisYearTransactions.fromJson(dynamic json) {
    total = json;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (total != null) {
      data['total'] = total;
    }

    return data;
  }
}

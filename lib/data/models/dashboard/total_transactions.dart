import '/core/app_export.dart';

class TotalTransactionsReq {
  TotalTransactionsReq();

  TotalTransactionsReq.fromJson(Map<String, dynamic> json) {
    TotalTransactionsReq();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}

class TotalTransactionsRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  TotalTransactions? data;

  TotalTransactionsRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  TotalTransactionsRes.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    result = json['result'];
    message = json['message'];
    messageDetails = MessageDetails.fromJson(json['messageDetails']);
    data = json['data'] != null ? TotalTransactions.fromJson(json['data']) : null;
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

class TotalTransactions {
  num? total;

  TotalTransactions({this.total});

  TotalTransactions.fromJson(dynamic json) {
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

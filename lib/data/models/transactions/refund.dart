import '/core/app_export.dart';

class RefundReq {
  num? tagNumber;
  num? amount;
  String? userNotes;

  RefundReq({this.tagNumber, this.amount, this.userNotes});

  Map<String, dynamic> toJson({Map<String, String>? filter}) {
    final temp = <String, dynamic>{};

    if (tagNumber != null) {
      temp['tagNumber'] = tagNumber;
    }

    if (amount != null) {
      temp['amount'] = amount;
    }

    if (userNotes != null) {
      temp['userNotes'] = userNotes;
    }

    return temp;
  }
}

class RefundRes {
  String? instanceId;
  bool? result;
  String? message;
  MessageDetails? messageDetails;
  Transaction? data;

  RefundRes({
    this.instanceId,
    this.result,
    this.message,
    this.messageDetails,
    this.data,
  });

  factory RefundRes.fromJson(Map<String, dynamic> json) {
    return RefundRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      data: json['data'] != null ? Transaction.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instanceId'] = instanceId;
    data['result'] = result;
    data['message'] = message;
    data['messageDetails'] = messageDetails;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RefundsRes {
  String instanceId;
  bool result;
  String message;
  List<Refund> data;
  num eligibleRefundAmount;
  MessageDetails? messageDetails;

  RefundsRes({
    this.instanceId = '',
    this.result = false,
    this.message = '',
    this.messageDetails,
    this.data = const [],
    this.eligibleRefundAmount = 0,
  });

  factory RefundsRes.fromJson(Map<String, dynamic> json) {
    return RefundsRes(
      instanceId: json['instanceId'],
      result: json['result'],
      message: json['message'],
      messageDetails: MessageDetails.fromJson(json['messageDetails']),
      eligibleRefundAmount: json['eligibleRefundAmount'],
      data: json['data'] != null
          ? (json['data'] as List).map((item) => Refund.fromJson(item)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instanceId': instanceId,
      'result': result,
      'message': message,
      'messageDetails': messageDetails,
      'eligibleRefundAmount': eligibleRefundAmount,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class Refund {
  int? tagNumber;
  String? invoice;
  num? approvedAmount;
  num? fee;
  String? approvalCode;
  String? sequenceNumber;
  String? transactionDate;
  String? userNotes;

  Refund({
    this.tagNumber,
    this.invoice,
    this.approvedAmount,
    this.fee,
    this.approvalCode,
    this.sequenceNumber,
    this.transactionDate,
    this.userNotes,
  });

  // Factory method to create a RefundData from JSON
  factory Refund.fromJson(Map<String, dynamic> json) {
    return Refund(
      tagNumber: json['tagNumber'],
      invoice: json['invoice'],
      approvedAmount: json['approvedAmount'],
      fee: json['fee'],
      approvalCode: json['approvalCode'],
      sequenceNumber: json['sequenceNumber'],
      transactionDate: json['transactionDate'],
      userNotes: json['userNotes'],
    );
  }

  // Method to convert RefundData to JSON
  Map<String, dynamic> toJson() {
    return {
      'tagNumber': tagNumber,
      'invoice': invoice,
      'approvedAmount': approvedAmount,
      'fee': fee,
      'approvalCode': approvalCode,
      'sequenceNumber': sequenceNumber,
      'transactionDate': transactionDate,
      'userNotes': userNotes,
    };
  }
}

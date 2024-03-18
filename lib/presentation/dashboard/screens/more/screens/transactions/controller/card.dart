import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/app_export.dart';

class ScanResult {
  String? cardHolderName;
  String? cardNumber;
  DateTime? expiryDate;
  String? cvv;

  ScanResult({
    this.cardHolderName,
    this.cardNumber,
    this.expiryDate,
    this.cvv,
  });
}

class CardController extends GetxController {
  Props props = Props();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TransactionsController controller = Get.find<TransactionsController>();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController ccvController = TextEditingController();

  Rx<String> expiryMonth = Rx('01');
  Rx<String> expiryYear = Rx('${DateTime.now().year + 5}');

  Rx<bool> saveCard = Rx(false);
  Rx<bool> addCard = Rx(false);

  String get license {
    if (Platform.isAndroid) {
      return "sRwCABRjb20uY29kaW5nZ2Vyby5kb25vcgBsZXlKRGNtVmhkR1ZrVDI0aU9qRTNNRGc0T0RFeE16WTBOREFzSWtOeVpXRjBaV1JHYjNJaU9pSXpZek5rWkRVNVlTMDJPR00yTFRSbVptSXRPR0ZqT0MxbE9Ea3hNRGxqT0RrMlpXSWlmUT09vTxUAMIn0PLBA9ObJ4xZ3g9hMOuzen1BvC1Tzj3/tQsnK2aQtEM6VBnA7eCyOikM8H/+xTBZYetbGlYp6eNuLrbcxcPjguvDax/KdCQa1KSAaMq7O+SO+mjO/s37";
    } else if (Platform.isIOS) {
      return "";
    } else {
      return "";
    }
  }

  @override
  onClose() {
    super.onClose();
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    ccvController.dispose();
  }

  Future<void> tryAgain() async {
    props.error(UseError(message: null));
  }

  Future<void> scanCard() async {
    try {
      ScanResult result = ScanResult();
      if (result.cardHolderName != null) {
        cardHolderNameController.text = result.cardHolderName!;
      }

      if (result.cardNumber != null) {
        cardNumberController.text = result.cardNumber!;
      }

      if (result.cvv != null) {
        ccvController.text = result.cvv!;
      }

      if (result.expiryDate != null) {
        DateTime? expiryDate = result.expiryDate;
        expiryMonth.value = expiryDate!.month.toString().padLeft(2, '0');
        expiryYear.value = expiryDate.year.toString();
      }
    } on PlatformException {
      Toasts.error(
        message:
            "Sorry your device not support credit card scanner. Please enter the information manually.",
      );
    }
  }
}

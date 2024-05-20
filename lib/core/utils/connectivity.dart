import 'dart:async';
import '/core/app_export.dart';

class Internet extends GetxController {
  RxBool connected = false.obs;

  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen(listen);
  }

  void listen(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile)) {
      connected.value = true;
    } else if (result.contains(ConnectivityResult.wifi)) {
      connected.value = true;
    } else if (result.contains(ConnectivityResult.ethernet)) {
      connected.value = true;
    } else if (result.contains(ConnectivityResult.vpn)) {
      connected.value = true;
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      connected.value = true;
    } else if (result.contains(ConnectivityResult.other)) {
      connected.value = true;
    } else if (result.contains(ConnectivityResult.none)) {
      connected.value = false;
    } else {
      connected.value = false;
    }
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}

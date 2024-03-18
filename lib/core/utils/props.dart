import '/core/app_export.dart';

enum UseState {
  none,
  done,
  error,
  loading,
  processing,
  resending,
  updating,
  deleting,
  downloading
}

class UseError {
  String? message;
  UseError({this.message}) {
    console.log(message, name: 'UseError');
  }
}

class Props {
  Rx<UseState> useState = Rx(UseState.none);
  Rx<UseError> error = Rx(UseError());
  Props();
}

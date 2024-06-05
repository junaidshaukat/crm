import 'dart:async';
import 'dart:io';
import '/core/app_export.dart';

class Backgroung extends GetxController {
  Timer? _timer;
  final _counter = 0.obs;
  int get counter => _counter.value;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        Directory cache = await getTemporaryDirectory();
        List<FileSystemEntity> contents = cache.listSync(recursive: true);
        console.log(contents.length, force: true, name: 'cache');
        for (var entity in contents) {
          if (entity is File) {
            if (await entity.exists()) {
              await entity.delete();
            }
          } else if (entity is Directory) {
            if (await entity.exists()) {
              await entity.delete(recursive: true);
            }
          }
        }
      } catch (e) {
        rethrow;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

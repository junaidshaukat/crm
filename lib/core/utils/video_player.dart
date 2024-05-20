import 'dart:io';
import '/core/app_export.dart';

class VideoDetails {
  static Future<VideoPlayerValue?> getInfo(File file) {
    VideoPlayerController controller = VideoPlayerController.file(file);
    return controller.initialize().then((value) {
      VideoPlayerValue value = controller.value;
      controller.dispose();
      return value;
    });
  }
}

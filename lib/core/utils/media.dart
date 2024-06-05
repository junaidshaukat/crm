import 'dart:io';
import 'dart:ui';
import '/core/app_export.dart';

class Media {
  final File file;
  final String path;
  final String name;
  final String extn;
  final String type;
  final double size;
  final int duration;
  final bool supported;
  final Size resolution;

  Media({
    required this.extn,
    required this.file,
    required this.name,
    required this.path,
    required this.size,
    required this.type,
    required this.duration,
    required this.supported,
    required this.resolution,
  });

  static Future<Media> factory(File param) async {
    int duration = 1;
    bool supported = false;
    VideoPlayerValue? video;
    Size resolution = Size.zero;

    List videos = ['mp4', 'mov'];
    List images = ['jpg', 'jpeg', 'png', 'bmp', 'gif'];

    File file = param;
    String path = file.path;
    String name = path.split('/').last;
    double size = file.lengthSync() / (1024 * 1024);
    String extn = path.split('/').last.split('.').last;
    String type = images.contains(extn.toLowerCase()) == true
        ? 'image'
        : videos.contains(extn.toLowerCase()) == true
            ? 'video'
            : 'unsupported';

    if (type == 'image') {
      supported = true;
    }

    if (type == 'video') {
      supported = true;
      video = await VideoDetails.getInfo(file);
      duration = video?.duration.inSeconds ?? 0;
      resolution = video?.size ?? Size.zero;
    }

    if (type == 'unsupported') {
      supported = false;
    }

    return Media(
      extn: extn,
      file: file,
      name: name,
      path: path,
      size: size,
      type: type,
      duration: duration,
      supported: supported,
      resolution: resolution,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'extn': extn,
      'file': file,
      'name': name,
      'path': path,
      'size': size,
      'type': type,
      'duration': duration,
      'supported': supported,
      'resolution': resolution,
    };
  }
}

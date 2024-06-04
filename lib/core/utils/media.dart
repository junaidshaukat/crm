import 'dart:io';
import 'dart:ui';

import '/core/app_export.dart';

enum MediaType { image, video, other }

class MediaFile {
  final bool imagePicker;
  final File? ipResult;
  final FilePickerResult? fpResult;
  VideoPlayerValue? video;

  MediaFile(
    this.imagePicker, {
    this.ipResult,
    this.fpResult,
  });

  File get file {
    if (imagePicker) {
      return File(ipResult!.path);
    } else {
      return File(fpResult!.xFiles.first.path);
    }
  }

  Future<void> init() async {
    if (type == 'video') {
      video = await VideoDetails.getInfo(file);
    }
  }

  String get path {
    return file.path;
  }

  String get name {
    return path.split('/').last;
  }

  String get extn {
    return path.split('/').last.split('.').last;
  }

  double get size {
    int bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  String get type {
    List images = ['jpg', 'jpeg', 'png', 'bmp', 'gif'];
    List videos = ['mp4'];

    if (images.contains(extn.toLowerCase())) {
      return 'image';
    } else if (videos.contains(extn.toLowerCase())) {
      return 'video';
    } else {
      return 'other';
    }
  }

  int get duration {
    if (type == 'video') {
      return video?.duration.inSeconds ?? 0;
    } else {
      return 1;
    }
  }

  Size get resolution {
    if (type == 'video') {
      return video?.size ?? Size.zero;
    } else {
      return Size.zero;
    }
  }

  toJson() {
    return {
      'picker': imagePicker ? 'image_picker' : 'file_picker',
      'file': file,
      'name': name,
      'extn': extn,
      'size': size,
      'path': path,
      'type': type,
      'duration': duration,
      'resolution': resolution,
    };
  }
}

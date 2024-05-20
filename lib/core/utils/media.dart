import 'dart:io';
import 'dart:ui';

enum ContentType { image, video, other }

class MediaFile {
  String path;
  String name;
  String extn;
  double size;
  int duration;
  Size resolution;

  MediaFile({
    this.path = '',
    this.name = '',
    this.extn = '',
    this.size = -1,
    this.duration = 0,
    this.resolution = Size.zero,
  });

  File get file => File(path);

  ContentType get content {
    List images = ['jpg', 'jpeg', 'png', 'bmp', 'gif'];
    List videos = ['mp4'];

    if (images.contains(extn.toLowerCase())) {
      return ContentType.image;
    } else if (videos.contains(extn.toLowerCase())) {
      return ContentType.video;
    } else {
      return ContentType.other;
    }
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

  toJson() {
    return {
      'file': file,
      'name': name,
      'extn': extn,
      'size': size,
      'path': path,
      'type': type,
      'content': content,
      'duration': duration,
      'resolution': resolution,
    };
  }
}

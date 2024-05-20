enum ContentType { image, video, other }

class MediaFile {
  String path;
  String name;
  String extn;
  double size;

  MediaFile({this.path = '', this.name = '', this.extn = '', this.size = -1});

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

  isVideo() {
    return true;
  }

  toJson() {
    return {
      'name': name,
      'extn': extn,
      'size': size,
      'path': path,
      'type': type,
      'content': content,
      // 'duration': duration,
      // 'resolution': resolution,
    };
  }
}

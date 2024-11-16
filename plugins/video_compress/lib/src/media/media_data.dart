abstract class Enum<T> {
  final T _value;

  const Enum(this._value);

  T get value => _value;
}

class MediaMetadataRetriever<int> extends Enum<int> {
  /// [Android] API level 10
  static const metadataKeyAlbum = MediaMetadataRetriever(1);

  /// [Android] API level 10
  static const metadataKeyAlbumArtist = MediaMetadataRetriever(13);

  /// [Android] API level 10
  static const metadataKeyArtist = MediaMetadataRetriever(2);

  /// [Android] API level 10
  static const metadataKeyAuthor = MediaMetadataRetriever(3);

  /// [Android] API level 14
  static const metadataKeyBitrate = MediaMetadataRetriever(20);

  /// [Android] API level 23
  static const metadataKeyCaptureFramerate = MediaMetadataRetriever(25);

  /// [Android] API level 10
  static const metadataKeyCdTrackNumber = MediaMetadataRetriever(0);

  /// [Android] API level 10
  static const metadataKeyCompilation = MediaMetadataRetriever(15);

  /// [Android] API level 10
  static const metadataKeyComposer = MediaMetadataRetriever(4);

  /// [Android] API level 10
  static const metadataKeyDate = MediaMetadataRetriever(5);

  /// [Android] API level 10
  static const metadataKeyDiscNumber = MediaMetadataRetriever(14);

  /// [Android] API level 10
  static const metadataKeyDuration = MediaMetadataRetriever(9);

  /// [Android] API level Q
  static const metadataKeyExifLength = MediaMetadataRetriever(34);

  /// [Android] API level Q
  static const metadataKeyExifOffset = MediaMetadataRetriever(33);

  /// [Android] API level 10
  static const metadataKeyGenre = MediaMetadataRetriever(6);

  /// [Android] API level 14
  static const metadataKeyHasAudio = MediaMetadataRetriever(16);

  /// [Android] API level 28
  static const metadataKeyHasImage = MediaMetadataRetriever(26);

  /// [Android] API level 14
  static const metadataKeyHasVideo = MediaMetadataRetriever(17);

  /// [Android] API level 28
  static const metadataKeyImageCount = MediaMetadataRetriever(27);

  /// [Android] API level 28
  static const metadataKeyImageHeight = MediaMetadataRetriever(30);

  /// [Android] API level 28
  static const metadataKeyImagePrimary = MediaMetadataRetriever(28);

  /// [Android] API level 28
  static const metadataKeyImageRotation = MediaMetadataRetriever(31);

  /// [Android] API level 28
  static const metadataKeyImageWidth = MediaMetadataRetriever(29);

  /// [Android] API level 15
  static const metadataKeyLocation = MediaMetadataRetriever(23);

  /// [Android] API level 10
  static const metadataKeyMimeType = MediaMetadataRetriever(12);

  /// [Android] API level 10
  static const metadataKeyNumTracks = MediaMetadataRetriever(10);

  /// [Android] API level 10
  static const metadataKeyTitle = MediaMetadataRetriever(7);

  /// [Android] API level 28
  static const metadataKeyVideoFrameCount = MediaMetadataRetriever(32);

  /// [Android] API level 14
  static const metadataKeyVideoHeight = MediaMetadataRetriever(19);

  /// [Android] API level 17
  static const metadataKeyVideoRotation = MediaMetadataRetriever(24);

  /// [Android] API level 14
  static const metadataKeyVideoWidth = MediaMetadataRetriever(18);

  /// [Android] API level 10
  static const metadataKeyWriter = MediaMetadataRetriever(11);

  /// [Android] API level 10
  static const metadataKeyYear = MediaMetadataRetriever(8);

  const MediaMetadataRetriever(super.value);
}

extension Assets on String {
  /// assets/fonts
  String get font {
    return 'assets/fonts/$this';
  }

  ///assets/icons
  String get icon {
    return 'assets/icons/$this';
  }

  ///assets/images
  String get network {
    return this;
  }

  ///assets/images
  String get image {
    return 'assets/images/$this';
  }

  ///assets/images
  String get gif {
    return 'assets/gif/$this';
  }

  ///ttf
  String get ttf {
    return '$this.ttf';
  }

  ///svg
  String get svg {
    return '$this.svg';
  }

  ///png
  String get png {
    return '$this.png';
  }

  ///png
  String get jpg {
    return '$this.jpg';
  }
}

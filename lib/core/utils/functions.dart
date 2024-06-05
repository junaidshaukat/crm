import 'dart:math';

class Functions {
  String get randomString {
    final random = Random();
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
    return List.generate(12, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}

Functions fn = Functions();

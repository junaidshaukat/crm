import 'dart:async';
import 'dart:developer' as developer;

enum ConsoleMode { debug, live, both }

class Console {
  final ConsoleMode mode;
  Console(this.mode);

  void log(
    dynamic message, {
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (mode == ConsoleMode.debug) {
      developer.log(
        "$message",
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        name: name,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
    if (mode == ConsoleMode.live) {
      developer.log(
        "$message",
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        name: name,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
    if (mode == ConsoleMode.both) {
      developer.log(
        "$message",
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        name: name,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

Console console = Console(ConsoleMode.debug);

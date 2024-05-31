import 'dart:async';
import 'dart:developer' as developer;

enum ConsoleMode { debug, release }

class Console {
  final ConsoleMode mode;
  Console(this.mode);

  void log(
    dynamic message, {
    bool force = false,
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
      return;
    } else {
      if (force) {
        developer.log(
          "$message",
          time: time,
          sequenceNumber: sequenceNumber,
          level: level,
          name: "force $name",
          zone: zone,
          error: error,
          stackTrace: stackTrace,
        );
      }
    }
  }
}

Console console = Console(ConsoleMode.release);

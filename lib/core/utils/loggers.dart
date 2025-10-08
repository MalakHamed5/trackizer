import 'package:flutter/foundation.dart';

class AppLogger {
  static void log(String message) {
    if (!kReleaseMode) {
      
      debugPrint(message);
    }
  }

  static void error(String message, [Object? error]) {
    if (!kReleaseMode) {
      debugPrint('❌ ERROR: $message');
      if (error != null) debugPrint('Details: $error');
    }
  }

  static void info(String message) {
    if (!kReleaseMode) {
      debugPrint('ℹ️ INFO: $message');
    }
  }

  static void warning(String message) {
    if (!kReleaseMode) {
      debugPrint('⚠️ WARNING: $message');
    }
  }
}

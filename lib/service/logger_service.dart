import 'package:logger/logger.dart';

class LoggerService {
  static var logger = Logger();

  static void debugLogger(String message) {
    logger.d(message);
  }

  static void errorLogger(String message) {
    logger.e(message);
  }

  static void warningLogger(String message) {
    logger.w(message);
  }
}

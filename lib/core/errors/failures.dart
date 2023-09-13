import 'package:flutter/foundation.dart';

@immutable
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

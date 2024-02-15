import 'package:flutter/material.dart';
import 'package:weather/constants/string_constants.dart' as string_constants;

String? GetErrorMessage(BuildContext context, errorMsg) {
  return '${string_constants.pleaseEnter} $errorMsg';
}

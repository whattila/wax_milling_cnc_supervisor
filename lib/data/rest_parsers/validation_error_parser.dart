import 'dart:convert';

import 'package:wax_milling_cnc_supervisor/data/rest_models/http_validation_error.dart';

import 'json_parser.dart';
import '../rest_models/validation_error.dart';

class ValidationErrorParser extends JsonParser<ValidationError> {
  const ValidationErrorParser();

  @override
  Future<ValidationError> parseFromJson(String json) async {
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    return ValidationError.fromJson(decoded);
  }
}
import 'dart:convert';

import 'package:wax_milling_cnc_supervisor/data/rest_models/http_validation_error.dart';

import 'json_parser.dart';

class HTTPValidationErrorParser extends JsonParser<HTTPValidationError> {
  const HTTPValidationErrorParser();

  @override
  Future<HTTPValidationError> parseFromJson(String json) async {
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    return HTTPValidationError.fromJson(decoded);
  }
}
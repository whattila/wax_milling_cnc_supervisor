import 'dart:convert';

import 'package:wax_milling_cnc_supervisor/data/rest_models/http_validation_error.dart';

import '../json_parser.dart';
import '../rest_models/operation_base.dart';

class OperationBaseParser extends JsonParser<List<OperationBase>> {
  const OperationBaseParser();

  @override
  Future<List<OperationBase>> parseFromJson(String json) async {
    final decoded = jsonDecode(json) as List<dynamic>;
    return decoded.map((value) => OperationBase.fromJson(value as Map<String, dynamic>)).toList();
  }
}
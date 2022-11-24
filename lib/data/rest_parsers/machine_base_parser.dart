import 'dart:convert';

import 'package:wax_milling_cnc_supervisor/data/rest_models/http_validation_error.dart';

import '../json_parser.dart';
import '../rest_models/machine_base.dart';

class MachineBaseParser extends JsonParser<List<MachineBase>> {
  const MachineBaseParser();

  @override
  Future<List<MachineBase>> parseFromJson(String json) async {
    final decoded = jsonDecode(json) as List<dynamic>;
    return decoded.map((value) => MachineBase.fromJson(value as Map<String, dynamic>)).toList();
  }
}
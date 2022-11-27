import 'dart:convert';

import '../rest_models/machine_base.dart';
import 'json_parser.dart';

class SingleMachineBaseParser extends JsonParser<MachineBase> {
  const SingleMachineBaseParser();

  @override
  Future<MachineBase> parseFromJson(String json) async {
    final decoded = jsonDecode(json) as Map<String, dynamic>;
    return MachineBase.fromJson(decoded);
  }
}
import 'package:json_annotation/json_annotation.dart';

part 'machine_update.g.dart';

@JsonSerializable()
class MachineUpdate {
  final int id;
  final String machine_code;
  final String machine_description;
  final int? tool_condition;

  const MachineUpdate({
    required this.id,
    required this.machine_code,
    required this.machine_description,
    this.tool_condition
  });

  Map<String, dynamic> toJson() => _$MachineUpdateToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MachineUpdate {
  final int id;
  final String machine_code;
  final String machine_description;
  // TODO: ha ez null, az a modelben 1 lesz, bármit jelent az
  final WornType? tool_condition;

  const MachineUpdate({
    required this.id,
    required this.machine_code,
    required this.machine_description,
    this.tool_condition
  });

  Map<String, dynamic> toJson() => _$MachineUpdateToJson(this);
}
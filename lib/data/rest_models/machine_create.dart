import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MachineCreate {
  final String machine_code;
  final String machine_description;
  // TODO: ha ez null, az a modelben 1 lesz, bármit jelent az
  final WornType? tool_condition;
  final bool? activate;

  const MachineCreate({
    required this.machine_code,
    required this.machine_description,
    this.tool_condition,
    this.activate
  });

  Map<String, dynamic> toJson() => _$MachineCreateToJson(this);
}
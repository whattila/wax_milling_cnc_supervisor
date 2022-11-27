import 'package:json_annotation/json_annotation.dart';

part 'machine_create.g.dart';

@JsonSerializable()
class MachineCreate {
  final String machine_code;
  final String machine_description;
  final int? tool_condition;
  final int? tool_condition_predicted;
  final bool? activate;

  const MachineCreate({
    required this.machine_code,
    required this.machine_description,
    this.tool_condition,
    this.tool_condition_predicted,
    this.activate
  });

  Map<String, dynamic> toJson() => _$MachineCreateToJson(this);
}
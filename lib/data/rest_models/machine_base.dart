import 'package:json_annotation/json_annotation.dart';

part 'machine_base.g.dart';

@JsonSerializable()
class MachineBase {
  final int id;
  final String machine_code;
  final String machine_description;
  final String? activation_date;
  final bool? is_active;
  final bool? is_working;
  final int? tool_condition;
  final int? tool_condition_predicted;

  const MachineBase({
    required this.id,
    required this.machine_code,
    required this.machine_description,
    this.activation_date,
    this.is_active,
    this.is_working,
    this.tool_condition,
    this.tool_condition_predicted
  });

  factory MachineBase.fromJson(Map<String, dynamic> json) => _$MachineBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MachineBaseToJson(this);
}
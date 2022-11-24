import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MachineBase {
  final int id;
  final String machine_code;
  final String machine_description;
  // TODO: a date-time format számít nekem?
  final String? activation_date;
  // TODO: ha ez null, az a modelben false lesz
  final bool? is_active;
  // TODO: ha ez null, az a modelben false lesz
  final bool? is_working;
  // TODO: ha ez null, az a modelben 1 lesz, bármit jelent az
  final WornType? tool_condition;

  const MachineBase({
    required this.id,
    required this.machine_code,
    required this.machine_description,
    this.activation_date,
    this.is_active,
    this.is_working,
    this.tool_condition
  });

  factory MachineBase.fromJson(Map<String, dynamic> json) => _$MachineBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MachineBaseToJson(this);
}
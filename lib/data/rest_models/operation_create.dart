import 'package:json_annotation/json_annotation.dart';

import 'machine_base.dart';

@JsonSerializable()
class OperationCreate {
  final String operation_code;
  final MachineBase machine;
  final double cutting_velocity;
  final double operation_pression;

  const OperationCreate({
    required this.operation_code,
    required this.machine,
    required this.cutting_velocity,
    required this.operation_pression,
  });

  Map<String, dynamic> toJson() => _$OperationCreateToJson(this);
}
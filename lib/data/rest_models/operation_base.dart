import 'package:json_annotation/json_annotation.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/machine_base.dart';

@JsonSerializable()
class OperationBase {
  final int id;
  final String operation_code;
  final MachineBase machine;
  final double cutting_velocity;
  final double operation_pression;
  final String? operation_start;
  final String? operation_end;
  // TODO: ha null, a modelben false
  final bool? operation_finished;

  const OperationBase({
    required this.id,
    required this.operation_code,
    required this.machine,
    required this.cutting_velocity,
    required this.operation_pression,
    this.operation_start,
    this.operation_end,
    this.operation_finished
  });

  factory OperationBase.fromJson(Map<String, dynamic> json) => _$OperationBaseFromJson(json);

  Map<String, dynamic> toJson() => _$OperationBaseToJson(this);
}
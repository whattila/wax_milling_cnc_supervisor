import 'package:json_annotation/json_annotation.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/machine_base.dart';

@JsonSerializable()
class OperationUpdate {
  final int id;
  final String operation_code;
  final MachineBase machine;
  final double cutting_velocity;
  final double operation_pression;

  const OperationUpdate({
    required this.id,
    required this.operation_code,
    required this.machine,
    required this.cutting_velocity,
    required this.operation_pression,
  });

  Map<String, dynamic> toJson() => _$OperationUpdateToJson(this);
}
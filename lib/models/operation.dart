import 'package:equatable/equatable.dart';

import '../data/rest_models/operation_base.dart';

class Operation extends Equatable {
  final int id;
  final String operationCode;
  final int machineId;
  final double cuttingVelocity;
  final double operationPression;
  final DateTime? operationStart;
  final DateTime? operationEnd;
  final bool operationFinished;

  const Operation ({
    required this.id,
    required this.operationCode,
    required this.machineId,
    required this.cuttingVelocity,
    required this.operationPression,
    required this.operationStart,
    required this.operationEnd,
    required this.operationFinished
  });

  Operation.fromOperationBase(OperationBase operationBase)
      : this(
          id: operationBase.id,
          operationCode: operationBase.operation_code,
          machineId:  operationBase.machine.id,
          cuttingVelocity: operationBase.cutting_velocity,
          operationPression: operationBase.operation_pression,
          operationStart: operationBase.operation_start != null ? DateTime.tryParse(operationBase.operation_start!) : null,
          operationEnd: operationBase.operation_end != null ? DateTime.tryParse(operationBase.operation_end!) : null,
          operationFinished: operationBase.operation_finished ?? false
        );

  @override
  List<Object?> get props => [id, operationCode, machineId, cuttingVelocity, operationPression, operationStart, operationEnd, operationFinished];

}
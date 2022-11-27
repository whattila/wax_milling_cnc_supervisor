import 'package:equatable/equatable.dart';

import '../data/rest_models/machine_base.dart';

enum WornType {worn, unworn}

extension WornTypeX on WornType {
  int toInt() {
    switch(this) {
      case WornType.worn:
        return 0;
      case WornType.unworn:
        return 1;
    }
  }
}

class Machine extends Equatable {
  final int id;
  final String machineCode;
  final String machineDescription;
  final DateTime? activationDate;
  final bool isActive;
  final bool isWorking;
  final WornType toolCondition;
  final WornType toolConditionPredicted;

  const Machine ({
    required this.id,
    required this.machineCode,
    required this.machineDescription,
    required this.activationDate,
    required this.isActive,
    required this.isWorking,
    required this.toolCondition,
    required this.toolConditionPredicted
  });

  Machine.fromMachineBase(MachineBase machineBase)
      : this(
          id: machineBase.id,
          machineCode: machineBase.machine_code,
          machineDescription: machineBase.machine_description,
          activationDate: machineBase.activation_date != null ? DateTime.tryParse(machineBase.activation_date!) : null,
          isActive: machineBase.is_active ?? false,
          isWorking: machineBase.is_working ?? false,
          toolCondition: WornType.values[machineBase.tool_condition ?? 1],
          toolConditionPredicted: WornType.values[machineBase.tool_condition_predicted ?? 1]
        );

  @override
  List<Object?> get props => [id, machineCode, machineDescription, activationDate, isActive, isWorking, toolCondition, toolConditionPredicted];
}
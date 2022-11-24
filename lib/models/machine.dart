import 'package:equatable/equatable.dart';

import '../data/rest_models/machine_base.dart';

enum WornType {unworn, worn}

class Machine extends Equatable {
  final int id;
  final String machineCode;
  final String machineDescription;
  final DateTime? activationDate;
  final bool isActive;
  final bool isWorking;
  final WornType toolCondition;

  const Machine ({
    required this.id,
    required this.machineCode,
    required this.machineDescription,
    required this.activationDate,
    required this.isActive,
    required this.isWorking,
    required this.toolCondition
  });

  Machine.fromMachineBase(MachineBase machineBase)
      : this(
          id: machineBase.id,
          machineCode: machineBase.machine_code,
          machineDescription: machineBase.machine_description,
          activationDate: machineBase.activation_date != null ? DateTime.tryParse(machineBase.activation_date!) : null,
          isActive: machineBase.is_active ?? false,
          isWorking: machineBase.is_working ?? false,
          toolCondition: machineBase.tool_condition ?? WornType.unworn
        );

  @override
  List<Object?> get props => [id, machineCode, machineDescription, activationDate, isActive, isWorking, toolCondition];
}
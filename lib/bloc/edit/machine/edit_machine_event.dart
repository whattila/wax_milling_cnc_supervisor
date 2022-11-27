import 'package:equatable/equatable.dart';
import 'package:wax_milling_cnc_supervisor/models/machine.dart';

class EditMachineEvent extends Equatable {
  const EditMachineEvent();

  @override
  List<Object?> get props => [];
}

class IsActiveChanged extends EditMachineEvent {
  const IsActiveChanged({required this.isActive});

  final bool isActive;

  @override
  List<Object?> get props => [isActive];
}

class ToolConditionChanged extends EditMachineEvent {
  const ToolConditionChanged({required this.toolCondition});

  final WornType toolCondition;

  @override
  List<Object?> get props => [toolCondition];
}

class MachineSaved extends EditMachineEvent {
  const MachineSaved({required this.machineCode, required this.machineDescription});

  final String machineCode;
  final String machineDescription;

  @override
  List<Object?> get props => [machineCode, machineDescription];
}
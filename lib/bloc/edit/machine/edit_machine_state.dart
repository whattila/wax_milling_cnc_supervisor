import 'package:equatable/equatable.dart';

import '../../../models/machine.dart';

enum EditStatus {initial, loading, success, failure}

class EditMachineState extends Equatable {
  const EditMachineState({
    this.initialMachine,
    this.status = EditStatus.initial,
    this.isActive = true,
    this.toolCondition = WornType.unworn
  });

  final Machine? initialMachine;
  final EditStatus status;
  final bool isActive;
  final WornType toolCondition;

  EditMachineState copyWith({Machine? initialMachine, EditStatus? status, bool? isActive, WornType? toolCondition}) =>
      EditMachineState(
        initialMachine: initialMachine ?? this.initialMachine,
        status: status ?? this.status,
        isActive: isActive ?? this.isActive,
        toolCondition: toolCondition ?? this.toolCondition
      );

  @override
  List<Object?> get props => [initialMachine, status, isActive, toolCondition];
}
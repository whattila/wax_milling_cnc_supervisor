import 'package:equatable/equatable.dart';

import '../../../models/machine.dart';

enum AddStatus {initial, loading, success, failure}

class AddOperationState extends Equatable {
  const AddOperationState({
    required this.status,
    required this.candidateMachines,
    required this.selectedMachineIndex
  });

  // TODO: a kódot nekünk kell megadni?
  final AddStatus status;
  final List<Machine> candidateMachines;
  final int selectedMachineIndex;

  AddOperationState copyWith({AddStatus? status, List<Machine>? candidateMachines, int? selectedMachineIndex}) =>
      AddOperationState(
        status: status ?? this.status,
        candidateMachines: candidateMachines ?? this.candidateMachines,
        selectedMachineIndex: selectedMachineIndex ?? this.selectedMachineIndex
      );

  @override
  List<Object?> get props => [status, candidateMachines, selectedMachineIndex];
}
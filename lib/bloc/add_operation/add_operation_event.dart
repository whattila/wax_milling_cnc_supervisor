import 'package:equatable/equatable.dart';

class AddOperationEvent extends Equatable {
  const AddOperationEvent();

  @override
  List<Object?> get props => [];
}

class MachineSelectionChanged extends AddOperationEvent {
  const MachineSelectionChanged({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}

class OperationSubmitted extends AddOperationEvent {
  const OperationSubmitted({required this.cuttingVelocity, required this.operationPression});

  final double cuttingVelocity;
  final double operationPression;

  @override
  List<Object?> get props => [cuttingVelocity, operationPression];
}
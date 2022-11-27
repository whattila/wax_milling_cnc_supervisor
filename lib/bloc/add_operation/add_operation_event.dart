import 'package:equatable/equatable.dart';

class AddOperationEvent extends Equatable {
  const AddOperationEvent();

  @override
  List<Object?> get props => [];
}

class PressionChanged extends AddOperationEvent {
  const PressionChanged({required this.pression});

  final double pression;

  @override
  List<Object?> get props => [pression];
}

class VelocityChanged extends AddOperationEvent {
  const VelocityChanged({required this.velocity});

  final double velocity;

  @override
  List<Object?> get props => [velocity];
}

class OperationSubmitted extends AddOperationEvent {
  const OperationSubmitted({required this.operationCode, required this.machineCode});

  final String operationCode;
  final String machineCode;

  @override
  List<Object?> get props => [operationCode, machineCode];
}
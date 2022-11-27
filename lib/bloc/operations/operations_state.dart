import 'package:equatable/equatable.dart';

import '../../models/operation.dart';

enum OperationsStatus {initial, loading, success, failure}

class OperationsState extends Equatable {
  const OperationsState({
    this.operations = const[],
    this.status = OperationsStatus.initial,
  });

  final List<Operation> operations;
  final OperationsStatus status;
  // TODO: ha teszünk be filtert, azzal kapcsolatban nézzük meg a MachinesState-et

  OperationsState copyWith({List<Operation>? operations, OperationsStatus? status}) =>
      OperationsState(operations: operations ?? this.operations, status: status ?? this.status);

  @override
  List<Object?> get props => [operations, status];
}
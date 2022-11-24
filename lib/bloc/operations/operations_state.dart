import 'package:equatable/equatable.dart';

import '../../models/operation.dart';

enum OperationsStatus {initial, loading, success, failure}

class OperationsState extends Equatable {
  const OperationsState({
    this.operations = const[],
    this.status = OperationsStatus.initial,
    this.filter = const OperationsFilter.initial()
  });

  final List<Operation> operations;
  final OperationsStatus status;
  final OperationsFilter filter;

  Iterable<Operation> get filteredOperations => filter.applyAll(operations);

  OperationsState copyWith({List<Operation>? operations, OperationsStatus? status, OperationsFilter? filter}) =>
      OperationsState(operations: operations ?? this.operations, status: status ?? this.status, filter: filter ?? this.filter);

  @override
  List<Object?> get props => [operations, status, filter];
}
import 'package:equatable/equatable.dart';

import '../../models/operation.dart';

abstract class OperationsEvent extends Equatable {
  const OperationsEvent();

  @override
  List<Object> get props => [];
}

class OperationsSubscriptionRequested extends OperationsEvent {
  const OperationsSubscriptionRequested();
}

class OperationDeleted extends OperationsEvent {
  const OperationDeleted(this.operation);

  final Operation operation;

  @override
  List<Object> get props => [operation];
}

class OperationsFilterChanged extends OperationsEvent {
  const OperationsFilterChanged(this.filter);

  final OperationsFilter filter;

  @override
  List<Object> get props => [filter];
}
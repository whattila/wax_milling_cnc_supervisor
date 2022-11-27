import 'package:equatable/equatable.dart';

import '../../../models/machine.dart';

enum AddStatus {initial, loading, success, failure}

extension AddStatusX on AddStatus {
  bool get isLoadingOrSuccess => [
    AddStatus.loading,
    AddStatus.success,
  ].contains(this);
}

class AddOperationState extends Equatable {
  const AddOperationState({
    this.status = AddStatus.initial,
    this.pression = 0.0,
    this.velocity = 0.0,
  });

  final AddStatus status;
  final double pression;
  final double velocity;

  AddOperationState copyWith({AddStatus? status, double? pression, double? velocity}) =>
      AddOperationState(
        status: status ?? this.status,
        pression:  pression ?? this.pression,
        velocity: velocity ?? this.velocity,
      );

  @override
  List<Object?> get props => [status, pression, velocity];
}
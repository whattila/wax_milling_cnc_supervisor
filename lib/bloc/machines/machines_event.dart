import 'package:equatable/equatable.dart';

import '../../models/machine.dart';
import 'machines_filter.dart';

abstract class MachinesEvent extends Equatable {
  const MachinesEvent();

  @override
  List<Object> get props => [];
}

class MachinesSubscriptionRequested extends MachinesEvent {
  const MachinesSubscriptionRequested();
}

class MachineDeleted extends MachinesEvent {
  const MachineDeleted(this.machine);

  final Machine machine;

  @override
  List<Object> get props => [machine];
}

class MachinesFilterChanged extends MachinesEvent {
  const MachinesFilterChanged(this.filter);

  final MachinesFilter filter;

  @override
  List<Object> get props => [filter];
}
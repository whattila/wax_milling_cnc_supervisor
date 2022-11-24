import 'package:equatable/equatable.dart';
import 'package:wax_milling_cnc_supervisor/bloc/machines/filter_enums.dart';
import 'package:wax_milling_cnc_supervisor/bloc/machines/machines_filter.dart';

import '../../models/machine.dart';

enum MachinesStatus {initial, loading, success, failure}

class MachinesState extends Equatable {
  const MachinesState({
    this.machines = const[],
    this.status = MachinesStatus.initial,
    this.filter = const MachinesFilter.initial()
  });

  final List<Machine> machines;
  final MachinesStatus status;
  final MachinesFilter filter;

  Iterable<Machine> get filteredMachines => filter.applyAll(machines);

  MachinesState copyWith({List<Machine>? machines, MachinesStatus? status, MachinesFilter? filter}) =>
      MachinesState(machines: machines ?? this.machines, status: status ?? this.status, filter: filter ?? this.filter);

  @override
  List<Object?> get props => [machines, status, filter];
}
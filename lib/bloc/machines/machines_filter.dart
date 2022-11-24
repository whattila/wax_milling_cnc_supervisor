import 'package:equatable/equatable.dart';
import 'package:wax_milling_cnc_supervisor/bloc/machines/filter_enums.dart';

import '../../models/machine.dart';

class MachinesFilter extends Equatable {
  final ActiveFilter activeFilter;
  final WorkingFilter workingFilter;
  final ToolConditionFilter toolConditionFilter;

  const MachinesFilter({required this.activeFilter, required this.workingFilter, required this.toolConditionFilter});

  const MachinesFilter.initial()
      : this(activeFilter: ActiveFilter.all, workingFilter: WorkingFilter.all, toolConditionFilter: ToolConditionFilter.all);

  Iterable<Machine> applyAll(Iterable<Machine> machines) => machines.where(_apply);

  bool _apply(Machine machine) => activeFilter.apply(machine) && workingFilter.apply(machine) && toolConditionFilter.apply(machine);

  @override
  List<Object?> get props => [activeFilter, workingFilter, toolConditionFilter];
}
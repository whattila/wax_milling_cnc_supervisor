import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';

import '../../models/machine.dart';
import 'machines_event.dart';
import 'machines_state.dart';

class MachinesBloc extends Bloc<MachinesEvent, MachinesState> {
  MachinesBloc({required CncServiceInterface cncServiceInterface})
      : _cncServiceInterface = cncServiceInterface,
        super(const MachinesState()) {
          on<MachinesSubscriptionRequested>(_onSubscriptionRequested);
          on<MachineDeleted>(_onMachineDeleted);
          on<MachinesFilterChanged>(_onFilterChanged);
        }

  final CncServiceInterface _cncServiceInterface;

  Future<void> _onSubscriptionRequested(
      MachinesSubscriptionRequested event,
      Emitter<MachinesState> emit,
      ) async {
    emit(state.copyWith(status: MachinesStatus.loading));

    await emit.forEach<List<Machine>>(
      _cncServiceInterface.getMachines(),
      onData: (machines) => state.copyWith(
        status: MachinesStatus.success,
        machines: machines,
      ),
      onError: (_, __) => state.copyWith(
        status: MachinesStatus.failure,
      ),
    );
  }

  Future<void> _onMachineDeleted(
      MachineDeleted event,
      Emitter<MachinesState> emit,
      ) async {
    // TODO: we may add some feedback here
    await _cncServiceInterface.deleteMachine(event.machine);
  }

  void _onFilterChanged(
      MachinesFilterChanged event,
      Emitter<MachinesState> emit,
      ) {
    emit(state.copyWith(filter: event.filter));
  }
}
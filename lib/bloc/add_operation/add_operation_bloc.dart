import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';

import '../../../models/machine.dart';
import 'add_operation_event.dart';
import 'add_operation_state.dart';

class AddOperationBloc extends Bloc<AddOperationEvent, AddOperationState> {
  AddOperationBloc({
    required CncServiceInterface cncServiceInterface,
  })  : _cncServiceInterface = cncServiceInterface,
        // TODO: meg kell szerezni a megfelelő gépek listáját
        super(
        AddOperationState(
            initialMachine: initialMachine,
            isActive: initialMachine?.isActive ?? true,
            toolCondition: initialMachine?.toolCondition ?? WornType.unworn
        ),
      ) {
    on<MachineSelectionChanged>(_onMachineSelectionChanged);
    on<OperationSubmitted>(_onOperationSubmitted);
  }

  final CncServiceInterface _cncServiceInterface;

  void _onMachineSelectionChanged(
      MachineSelectionChanged event,
      Emitter<AddOperationState> emit,
      ) {
    emit(state.copyWith(selectedMachineIndex: event.index));
  }

  void _onOperationSubmitted(
      OperationSubmitted event,
      Emitter<AddOperationState> emit,
      ) {
    // TODO: akkor mentsük a gépet, ügyelve a hibakezelésre is!
  }
}
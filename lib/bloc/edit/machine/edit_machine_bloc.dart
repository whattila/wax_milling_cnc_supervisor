import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';

import '../../../models/machine.dart';
import 'edit_machine_event.dart';
import 'edit_machine_state.dart';

class EditMachineBloc extends Bloc<EditMachineEvent, EditMachineState> {
  EditMachineBloc({
    required CncServiceInterface cncServiceInterface,
    required Machine? initialMachine,
  })  : _cncServiceInterface = cncServiceInterface,
        super(
        EditMachineState(
          initialMachine: initialMachine,
          isActive: initialMachine?.isActive ?? true,
          toolCondition: initialMachine?.toolCondition ?? WornType.unworn
        ),
      ) {
    on<IsActiveChanged>(_onIsActiveChanged);
    on<ToolConditionChanged>(_onToolConditionChanged);
    on<MachineSaved>(_onMachineSaved);
  }

  final CncServiceInterface _cncServiceInterface;

  void _onIsActiveChanged(
      IsActiveChanged event,
      Emitter<EditMachineState> emit,
      ) {
    emit(state.copyWith(isActive: event.isActive));
  }

  void _onToolConditionChanged(
      ToolConditionChanged event,
      Emitter<EditMachineState> emit,
      ) {
    emit(state.copyWith(toolCondition: event.toolCondition));
  }

  Future<void> _onMachineSaved(
      MachineSaved event,
      Emitter<EditMachineState> emit,
      ) async {
    // TODO: do this, partly based on EditTodo from the example, but also on what we need here
  }
}
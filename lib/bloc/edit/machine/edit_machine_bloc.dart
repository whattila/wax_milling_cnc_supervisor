import 'package:flutter_bloc/flutter_bloc.dart';
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
    emit(state.copyWith(status: EditStatus.loading));
    final machine = Machine(
        id: state.initialMachine?.id ?? -1,
        isWorking: state.initialMachine?.isWorking ?? false,
        isActive: state.isActive,
        machineDescription: event.machineDescription,
        activationDate: state.initialMachine?.activationDate,
        toolCondition: state.toolCondition,
        toolConditionPredicted: state.initialMachine?.toolConditionPredicted ?? WornType.unworn,
        machineCode: event.machineCode,
    );

    if (state.isNewMachine) {
      if (state.isActive) {
        _cncServiceInterface.activateMachine(machine);
      }
    }
    else {
      if (state.isActive != state.initialMachine!.isActive) {
        if (state.isActive) {
          _cncServiceInterface.activateMachine(machine);
        }
        else {
          _cncServiceInterface.deactivateMachine(machine);
        }
      }
    }

    try {
      await _cncServiceInterface.createMachine(machine);
      emit(state.copyWith(status: EditStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditStatus.failure));
    }
  }
}
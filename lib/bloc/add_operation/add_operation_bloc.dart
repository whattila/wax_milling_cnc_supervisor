import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';

import '../../../models/machine.dart';
import '../../models/operation.dart';
import 'add_operation_event.dart';
import 'add_operation_state.dart';

class AddOperationBloc extends Bloc<AddOperationEvent, AddOperationState> {
  AddOperationBloc({
    required CncServiceInterface cncServiceInterface,
  })  : _cncServiceInterface = cncServiceInterface,
        super(
        const AddOperationState(),
      ) {
    on<PressionChanged>(_onPressionChanged);
    on<VelocityChanged>(_onVelocityChanged);
    on<OperationSubmitted>(_onOperationSubmitted);
  }

  final CncServiceInterface _cncServiceInterface;

  static const pressionMinValue = 0.0;
  static const velocityMinValue = 0.0;

  static const pressionMaxValue = 100.0;
  static const velocityMaxValue = 100.0;

  void _onPressionChanged(
      PressionChanged event,
      Emitter<AddOperationState> emit,
      ) {
    emit(state.copyWith(pression: event.pression));
  }

  void _onVelocityChanged(
      VelocityChanged event,
      Emitter<AddOperationState> emit,
      ) {
    emit(state.copyWith(velocity: event.velocity));
  }

  Future<void> _onOperationSubmitted(
      OperationSubmitted event,
      Emitter<AddOperationState> emit,
      ) async {
    emit(state.copyWith(status: AddStatus.loading));

    final machine = await _cncServiceInterface.getMachineByCode(event.machineCode);

    final operation = Operation(
      id: -1,
      operationCode: event.operationCode,
      machineId: machine.id,
      cuttingVelocity: state.velocity,
      operationPression: state.pression,
      operationFinished: false,
      operationFinishedPrediction: true
    );

    try {
      await _cncServiceInterface.createOperation(operation, machine);
      emit(state.copyWith(status: AddStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddStatus.failure));
    }
  }
}
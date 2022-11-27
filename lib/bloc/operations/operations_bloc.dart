import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cnc_service_interface.dart';
import '../../models/operation.dart';
import 'operations_event.dart';
import 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  OperationsBloc({required CncServiceInterface cncServiceInterface})
      : _cncServiceInterface = cncServiceInterface,
        super(const OperationsState()) {
          on<OperationsSubscriptionRequested>(_onSubscriptionRequested);
          on<OperationDeleted>(_onOperationDeleted);
          on<OperationsFilterChanged>(_onFilterChanged);
        }

  final CncServiceInterface _cncServiceInterface;

  Future<void> _onSubscriptionRequested(
      OperationsSubscriptionRequested event,
      Emitter<OperationsState> emit,
      ) async {
    emit(state.copyWith(status: OperationsStatus.loading));

    await emit.forEach<List<Operation>>(
      _cncServiceInterface.getOperations(),
      onData: (operations) => state.copyWith(
        status: OperationsStatus.success,
        operations: operations,
      ),
      onError: (_, __) => state.copyWith(
        status: OperationsStatus.failure,
      ),
    );
  }

  Future<void> _onOperationDeleted(
      OperationDeleted event,
      Emitter<OperationsState> emit,
      ) async {
    // TODO: we may add some feedback here
    await _cncServiceInterface.deleteOperation(event.operation);
  }

  void _onFilterChanged(
      OperationsFilterChanged event,
      Emitter<OperationsState> emit,
      ) {
    // itt most nincs semmi, de ha lenne működő filter akkor lenne
  }
}
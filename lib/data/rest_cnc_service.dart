import 'package:wax_milling_cnc_supervisor/models/machine.dart';

import 'package:wax_milling_cnc_supervisor/models/operation.dart';

import 'cnc_service_interface.dart';

class RESTCncService implements CncServiceInterface{
  @override
  Future<void> createMachine(Machine machine) {
    // TODO: implement createMachine
    throw UnimplementedError();
  }

  @override
  Future<void> createOperation(Operation operation) {
    // TODO: implement createOperation
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMachine(Machine machine) {
    // TODO: implement deleteMachine
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOperation(Operation operation) {
    // TODO: implement deleteOperation
    throw UnimplementedError();
  }

  @override
  Stream<List<Machine>> getMachines() async* {
    while(true) {
      await Future.delayed(const Duration(milliseconds: 500));

    }
  }

  @override
  Stream<List<Operation>> getOperations() {
    // TODO: implement getOperations
    throw UnimplementedError();
  }

  @override
  Future<void> updateMachine(Machine machine) {
    // TODO: implement updateMachine
    throw UnimplementedError();
  }

  @override
  Future<void> updateOperation(Operation operation) {
    // TODO: implement updateOperation
    throw UnimplementedError();
  }
  
}
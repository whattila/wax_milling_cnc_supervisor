import 'package:wax_milling_cnc_supervisor/models/machine.dart';
import 'package:wax_milling_cnc_supervisor/models/operation.dart';

abstract class CncServiceInterface {

  Future<void> createMachine(Machine machine);

  Stream<List<Machine>> getMachines();

  Future<void> updateMachine(Machine machine);

  Future<void> deleteMachine(Machine machine);

  Future<void> createOperation(Operation operation);

  Stream<List<Operation>> getOperations();

  Future<void> updateOperation(Operation operation);

  Future<void> deleteOperation(Operation operation);
}
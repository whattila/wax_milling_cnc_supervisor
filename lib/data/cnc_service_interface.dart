import 'package:wax_milling_cnc_supervisor/models/machine.dart';
import 'package:wax_milling_cnc_supervisor/models/operation.dart';

abstract class CncServiceInterface {

  Future<void> createMachine(Machine machine);

  Stream<List<Machine>> getMachines();

  Future<void> updateMachine(Machine machine);

  Future<void> deleteMachine(Machine machine);

  Future<void> createOperation(Operation operation, Machine selectedMachine);

  Stream<List<Operation>> getOperations();

  Future<void> updateOperation(Operation operation, Machine selectedMachine);

  Future<void> deleteOperation(Operation operation);

  Future<void> activateMachine(Machine machine);

  Future<void> deactivateMachine(Machine machine);

  Future<Machine> getMachineByCode(String code);
}
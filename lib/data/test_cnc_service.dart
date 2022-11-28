import 'dart:math';

import 'package:wax_milling_cnc_supervisor/models/machine.dart';

import 'package:wax_milling_cnc_supervisor/models/operation.dart';

import 'cnc_service_interface.dart';

class TestCncService implements CncServiceInterface {
  static final List<Machine> machines = [
    Machine(
        toolConditionPredicted: WornType.unworn,
        toolCondition: WornType.unworn,
        isActive: true,
        machineDescription: 'The first machine',
        activationDate: DateTime.utc(1989, 11, 9),
        machineCode: 'abcdef',
        id: 1,
        isWorking: true
    ),
    Machine(
        toolConditionPredicted: WornType.unworn,
        toolCondition: WornType.worn,
        isActive: false,
        machineDescription: 'The second machine',
        activationDate: DateTime.utc(1989, 11, 9),
        machineCode: 'ghijkl',
        id: 2,
        isWorking: false
    ),
  ];

  static List<Operation> operations = [
    Operation(
        machineId: 1,
        operationPression: 23.5,
        id: 1,
        cuttingVelocity: 10.1,
        operationFinished: true,
        operationCode: 'aaaa',
        operationFinishedPrediction: true,
        operationStart: DateTime.utc(1989, 11, 9),
        operationEnd: DateTime.utc(1989, 11, 10),
    ),
    Operation(
        machineId: 1,
        operationPression: 10.9,
        id: 2,
        cuttingVelocity: 90,
        operationFinished: false,
        operationCode: 'bbbb',
        operationFinishedPrediction: false,
        operationStart: DateTime.utc(1989, 11, 9),
        operationEnd: DateTime.utc(1989, 11, 10),
    ),
    Operation(
        machineId: 1,
        operationPression: 21.3,
        id: 3,
        cuttingVelocity: 76,
        operationFinished: false,
        operationCode: 'cccc',
        operationFinishedPrediction: true,
        operationStart: DateTime.utc(1989, 11, 9),
    ),
  ];

  @override
  Future<void> activateMachine(Machine machine) async {
    final selectedIndex = machines.indexWhere((element) => element.id == machine.id);
    machines[selectedIndex] = machines[selectedIndex].copyWith(isActive: true);
  }

  @override
  Future<void> createMachine(Machine machine) async {
    machines.add(machine.copyWith(id: Random().nextInt(100) + 10));
  }

  @override
  Future<void> createOperation(Operation operation, Machine selectedMachine) async {
    operations.add(operation.copyWith(machineId: selectedMachine.id, id: Random().nextInt(100) + 10));
  }

  @override
  Future<void> deactivateMachine(Machine machine) async {
    final selectedIndex = machines.indexWhere((element) => element.id == machine.id);
    machines[selectedIndex] = machines[selectedIndex].copyWith(isActive: false);
  }

  @override
  Future<void> deleteMachine(Machine machine) async {
    machines.removeWhere((element) => element.id == machine.id);
  }

  @override
  Future<void> deleteOperation(Operation operation) async {
    operations.removeWhere((element) => element.id == operation.id);
  }

  @override
  Future<Machine> getMachineByCode(String code) async => machines.firstWhere((element) => element.machineCode == code);

  @override
  Stream<List<Machine>> getMachines() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield machines;
    }
  }

  @override
  Stream<List<Operation>> getOperations() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield operations;
    }
  }

  @override
  Future<void> updateMachine(Machine machine) async {
    final selectedIndex = machines.indexWhere((element) => element.id == machine.id);
    machines[selectedIndex] = machine;
  }

  @override
  Future<void> updateOperation(Operation operation, Machine selectedMachine) async {
    final selectedIndex = operations.indexWhere((element) => element.id == operation.id);
    operations[selectedIndex] = operation.copyWith(machineId: selectedMachine.id);
  }

}
import 'package:wax_milling_cnc_supervisor/data/request_rest.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/machine_base.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/machine_create.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/machine_update.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/operation_create.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/operation_update.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_parsers/http_validation_error_parser.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_parsers/machine_base_parser.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_parsers/operation_base_parser.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_parsers/single_machine_base_parser.dart';
import 'package:wax_milling_cnc_supervisor/models/machine.dart';

import 'package:wax_milling_cnc_supervisor/models/operation.dart';

import 'cnc_service_interface.dart';

class RESTCncService implements CncServiceInterface {
  @override
  Future<void> createMachine(Machine machine) async {
    final machineJson = MachineCreate(
        machine_code: machine.machineCode,
        machine_description: machine.machineDescription,
        tool_condition: machine.toolCondition.toInt(),
        activate: machine.isActive
    ).toJson();

    await RequestREST(
      endpoint: '/api/v1/machines/',
      data: machineJson // TODO: reméljük nem baj hogy a data Map<String, dynamic>
    ).executePost(const MachineBaseParser());

    // TODO: reméljük a kivételek feldobódnak a blocig...
  }

  @override
  Future<void> createOperation(Operation operation, Machine selectedMachine) async {
    final selectedMachineBase = MachineBase(
      id: selectedMachine.id,
      machine_code: selectedMachine.machineCode,
      machine_description: selectedMachine.machineDescription,
      activation_date: selectedMachine.activationDate.toString(), // TODO: reméljük ez jó formátumba kerül...
      is_active: selectedMachine.isActive,
      is_working: selectedMachine.isWorking,
      tool_condition: selectedMachine.toolCondition.toInt()
    );

    final operationJson = OperationCreate(
        operation_code: operation.operationCode,
        machine: selectedMachineBase,
        cutting_velocity: operation.cuttingVelocity,
        operation_pression: operation.operationPression
    ).toJson();

    await RequestREST(
        endpoint: '/api/v1/operations/',
        data: operationJson
    ).executePost(const OperationBaseParser());
  }

  @override
  Future<void> deleteMachine(Machine machine) async {
    await RequestREST(
        endpoint: '/api/v1/machines/${machine.id}',
    ).executeDelete(const HTTPValidationErrorParser());
    // TODO: elég az endpoint, nem kell még valami paraméter is?
  }

  @override
  Future<void> deleteOperation(Operation operation) async {
    await RequestREST(
        endpoint: '/api/v1/operations/${operation.id}',
    ).executeDelete(const HTTPValidationErrorParser());
  }

  @override
  Stream<List<Machine>> getMachines() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 5000));
      final machineBaseList = await const RequestREST(endpoint: '/api/v1/machines/').executeGet(const MachineBaseParser());
      final machineList = machineBaseList?.map((machineBase) => Machine.fromMachineBase(machineBase)) as List<Machine>;
      yield machineList;
    }
  }

  @override
  Stream<List<Operation>> getOperations() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 5000));
      final operationBaseList = await const RequestREST(endpoint: '/api/v1/operations/').executeGet(const OperationBaseParser());
      final operationList = operationBaseList?.map((operationBase) => Operation.fromOperationBase(operationBase)) as List<Operation>;
      yield operationList;
    }
  }

  @override
  Future<void> updateMachine(Machine machine) async {
    final machineUpdateJson = MachineUpdate(
      id: machine.id,
      machine_code: machine.machineCode,
      machine_description: machine.machineDescription,
      tool_condition: machine.toolCondition.toInt()
    ).toJson();

    await RequestREST(
      endpoint: '/api/v1/machines/${machine.id}',
      data: machineUpdateJson
    ).executePut(const HTTPValidationErrorParser());
  }

  @override
  Future<void> updateOperation(Operation operation, Machine selectedMachine) async {
    final selectedMachineBase = MachineBase(
        id: selectedMachine.id,
        machine_code: selectedMachine.machineCode,
        machine_description: selectedMachine.machineDescription,
        activation_date: selectedMachine.activationDate.toString(),
        is_active: selectedMachine.isActive,
        is_working: selectedMachine.isWorking,
        tool_condition: selectedMachine.toolCondition.toInt()
    );

    final operationUpdateJson = OperationUpdate(
        id: operation.id,
        operation_code: operation.operationCode,
        machine: selectedMachineBase,
        cutting_velocity: operation.cuttingVelocity,
        operation_pression: operation.operationPression
    ).toJson();

    await RequestREST(
        endpoint: '/api/v1/operations/${operation.id}',
        data: operationUpdateJson
    ).executePut(const HTTPValidationErrorParser());
  }

  @override
  Future<void> activateMachine(Machine machine) async {
    final machineUpdateJson = MachineUpdate(
        id: machine.id,
        machine_code: machine.machineCode,
        machine_description: machine.machineDescription,
        tool_condition: machine.toolCondition.toInt()
    ).toJson();

    await RequestREST(
        endpoint: '/api/v1/machines/activate/${machine.id}',
        data: machineUpdateJson
    ).executePut(const HTTPValidationErrorParser());
  }

  @override
  Future<void> deactivateMachine(Machine machine) async {
    final machineUpdateJson = MachineUpdate(
        id: machine.id,
        machine_code: machine.machineCode,
        machine_description: machine.machineDescription,
        tool_condition: machine.toolCondition.toInt()
    ).toJson();

    await RequestREST(
        endpoint: '/api/v1/machines/deactivate/${machine.id}',
        data: machineUpdateJson
    ).executePut(const HTTPValidationErrorParser());
  }

  @override
  Future<Machine> getMachineByCode(String code) async {
    final machineBase = await RequestREST(endpoint: '/api/v1/machines/search_by_machine_code/$code')
        .executeGet(const SingleMachineBaseParser());
    return Machine.fromMachineBase(machineBase!);
  }
}
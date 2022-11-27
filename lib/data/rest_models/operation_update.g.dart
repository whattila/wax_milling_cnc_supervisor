// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationUpdate _$OperationUpdateFromJson(Map<String, dynamic> json) =>
    OperationUpdate(
      id: json['id'] as int,
      operation_code: json['operation_code'] as String,
      machine: MachineBase.fromJson(json['machine'] as Map<String, dynamic>),
      cutting_velocity: (json['cutting_velocity'] as num).toDouble(),
      operation_pression: (json['operation_pression'] as num).toDouble(),
    );

Map<String, dynamic> _$OperationUpdateToJson(OperationUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operation_code': instance.operation_code,
      'machine': instance.machine,
      'cutting_velocity': instance.cutting_velocity,
      'operation_pression': instance.operation_pression,
    };

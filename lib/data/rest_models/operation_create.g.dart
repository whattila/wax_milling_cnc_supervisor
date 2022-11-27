// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationCreate _$OperationCreateFromJson(Map<String, dynamic> json) =>
    OperationCreate(
      operation_code: json['operation_code'] as String,
      machine: MachineBase.fromJson(json['machine'] as Map<String, dynamic>),
      cutting_velocity: (json['cutting_velocity'] as num).toDouble(),
      operation_pression: (json['operation_pression'] as num).toDouble(),
    );

Map<String, dynamic> _$OperationCreateToJson(OperationCreate instance) =>
    <String, dynamic>{
      'operation_code': instance.operation_code,
      'machine': instance.machine,
      'cutting_velocity': instance.cutting_velocity,
      'operation_pression': instance.operation_pression,
    };

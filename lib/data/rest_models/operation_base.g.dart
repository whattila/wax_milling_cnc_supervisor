// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationBase _$OperationBaseFromJson(Map<String, dynamic> json) =>
    OperationBase(
      id: json['id'] as int,
      operation_code: json['operation_code'] as String,
      machine: MachineBase.fromJson(json['machine'] as Map<String, dynamic>),
      cutting_velocity: (json['cutting_velocity'] as num).toDouble(),
      operation_pression: (json['operation_pression'] as num).toDouble(),
      operation_start: json['operation_start'] as String?,
      operation_end: json['operation_end'] as String?,
      operation_finished: json['operation_finished'] as bool?,
      operation_finished_prediction:
          json['operation_finished_prediction'] as bool?,
    );

Map<String, dynamic> _$OperationBaseToJson(OperationBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operation_code': instance.operation_code,
      'machine': instance.machine,
      'cutting_velocity': instance.cutting_velocity,
      'operation_pression': instance.operation_pression,
      'operation_start': instance.operation_start,
      'operation_end': instance.operation_end,
      'operation_finished': instance.operation_finished,
      'operation_finished_prediction': instance.operation_finished_prediction,
    };

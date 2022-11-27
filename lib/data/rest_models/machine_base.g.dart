// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineBase _$MachineBaseFromJson(Map<String, dynamic> json) => MachineBase(
      id: json['id'] as int,
      machine_code: json['machine_code'] as String,
      machine_description: json['machine_description'] as String,
      activation_date: json['activation_date'] as String?,
      is_active: json['is_active'] as bool?,
      is_working: json['is_working'] as bool?,
      tool_condition: json['tool_condition'] as int?,
      tool_condition_predicted: json['tool_condition_predicted'] as int?,
    );

Map<String, dynamic> _$MachineBaseToJson(MachineBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'machine_code': instance.machine_code,
      'machine_description': instance.machine_description,
      'activation_date': instance.activation_date,
      'is_active': instance.is_active,
      'is_working': instance.is_working,
      'tool_condition': instance.tool_condition,
      'tool_condition_predicted': instance.tool_condition_predicted,
    };

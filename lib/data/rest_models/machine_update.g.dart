// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineUpdate _$MachineUpdateFromJson(Map<String, dynamic> json) =>
    MachineUpdate(
      id: json['id'] as int,
      machine_code: json['machine_code'] as String,
      machine_description: json['machine_description'] as String,
      tool_condition: json['tool_condition'] as int?,
    );

Map<String, dynamic> _$MachineUpdateToJson(MachineUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'machine_code': instance.machine_code,
      'machine_description': instance.machine_description,
      'tool_condition': instance.tool_condition,
    };

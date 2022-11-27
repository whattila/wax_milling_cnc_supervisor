// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachineCreate _$MachineCreateFromJson(Map<String, dynamic> json) =>
    MachineCreate(
      machine_code: json['machine_code'] as String,
      machine_description: json['machine_description'] as String,
      tool_condition: json['tool_condition'] as int?,
      tool_condition_predicted: json['tool_condition_predicted'] as int?,
      activate: json['activate'] as bool?,
    );

Map<String, dynamic> _$MachineCreateToJson(MachineCreate instance) =>
    <String, dynamic>{
      'machine_code': instance.machine_code,
      'machine_description': instance.machine_description,
      'tool_condition': instance.tool_condition,
      'tool_condition_predicted': instance.tool_condition_predicted,
      'activate': instance.activate,
    };

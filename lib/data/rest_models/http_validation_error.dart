import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HTTPValidationError {
  // TODO: a kapott jsonökben kis- vagy nagybetűvel kezdődnek a propertyk?
  final List<ValidationError>? detail;

  const HTTPValidationError({this.detail});

  factory HTTPValidationError.fromJson(Map<String, dynamic> json) => _$HTTPValidationErrorFromJson(json);
}
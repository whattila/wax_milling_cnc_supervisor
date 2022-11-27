import 'package:json_annotation/json_annotation.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_models/validation_error.dart';

part 'http_validation_error.g.dart';

@JsonSerializable()
class HTTPValidationError {
  // TODO: a kapott jsonökben kis- vagy nagybetűvel kezdődnek a propertyk?
  final List<ValidationError>? detail;

  const HTTPValidationError({this.detail});

  factory HTTPValidationError.fromJson(Map<String, dynamic> json) => _$HTTPValidationErrorFromJson(json);
}
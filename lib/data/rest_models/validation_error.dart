import 'package:json_annotation/json_annotation.dart';

part 'validation_error.g.dart';

@JsonSerializable()
class ValidationError {
  final List<dynamic> loc; // TODO: ez mi akar lenni?
  final String msg;
  final String type;

  const ValidationError({required this.loc, required this.msg, required this.type});

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);
}
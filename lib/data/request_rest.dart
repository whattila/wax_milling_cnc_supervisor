import 'package:dio/dio.dart';

import 'rest_parsers/json_parser.dart';

class RequestREST {
  final String endpoint;
  final Map<String, dynamic> data;

  const RequestREST({
    required this.endpoint,
    this.data = const{},
  });

  static final _client = Dio(
    BaseOptions(
      baseUrl: "INSERT URL HERE",
      connectTimeout: 3000,
      receiveTimeout: 3000,
      headers: <String, String>{
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiY2xpZW50SUQiOiJDbGllbnQxIiwicmVnaXN0cmF0aW9uX2RhdGUiOiIyMDIyLTExLTI1VDIwOjI3OjA4Ljk4OTQ0MiIsInRva2VuIjoiIn0.-tGJ2yEJka_h4Dd3VFZzVXkktqt1kmCSBWG9P2oRWpk"
      }
    )
  );

  static const httpOK = 200;

  Future<T?> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);
    if (response.statusCode == httpOK) {
      return parser.parseFromJson(response.data!);
    }
    return null;
  }

  Future<void> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    await _client.post<String>(endpoint, data: formData);
  }

  Future<void> executePut<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    await _client.put<String>(endpoint, data: formData);
  }

  Future<void> executeDelete<T>(JsonParser<T> parser) async {
    await _client.delete<String>(endpoint);
  }
}
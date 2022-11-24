import 'package:dio/dio.dart';

import 'json_parser.dart';

class RequestREST {
  final String endpoint;
  final Map<String, String> data;

  const RequestREST({
    required this.endpoint,
    this.data = const{},
  });

  static final _client = Dio(
    BaseOptions(
      baseUrl: "INSERT URL HERE",
      connectTimeout: 3000,
      receiveTimeout: 3000,
      //TODO: any headers?
    )
  );

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);
    return parser.parseFromJson(response.data);
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(endpoint, data: formData);
    return parser.parseFromJson(response.data);
  }
}
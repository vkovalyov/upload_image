import 'package:dio/dio.dart';
import 'package:upload_image/src/core/api/executors/request_executor.dart';
import 'package:upload_image/src/core/errors/network_failures.dart';

class ApiPostExecutor implements RequestExecutor {
  final Dio _dio;

  ApiPostExecutor(this._dio);

  @override
  Future<Response> execute({RequestOptions? requestOptions}) async {
    try {
      FormData formData = FormData.fromMap(requestOptions?.data);
      final response = await _dio.post(
        _dio.options.baseUrl,
        data: formData,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw NetworkFailure();
      }
    } on DioError {
      throw NetworkFailure();
    }
  }
}

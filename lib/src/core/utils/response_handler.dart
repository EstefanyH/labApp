// lib/src/core/utils/response_handler.dart
import 'package:applab/src/core/domain/entities/api_response.dart';
import 'package:dio/dio.dart';

class ResponseHandler {
  static ApiResponse<T> handleResponse<T>({
    required Response response,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        
        // Si tu API tiene una estructura estándar
        if (data is Map<String, dynamic>) {
          return ApiResponse<T>.fromJson(data, fromJson);
        } else {
          // Si la respuesta es directamente el objeto
          return ApiResponse<T>(
            success: true,
            message: '',
            statusCode: response.statusCode!,
            data: fromJson({'data': data}), // Ajusta según tu estructura
          );
        }
      } else {
        throw Exception('Request failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error processing response: $e');
    }
  }

  static Exception handleError(dynamic error) {
    if (error is DioException) {
      return Exception('Network error: ${error.message}');
    }
    return Exception('Unexpected error: $error');
  }
}
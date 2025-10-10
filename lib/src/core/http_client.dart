import 'package:applab/src/core/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  late final Dio _dio;

  HttpClient({
    required String baseUrl,
    Map<String, dynamic>? defaultHeaders,
    int connectTimeout = 30000,
    int receiveTimeout = 30000
  }){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
      headers: defaultHeaders ?? {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) => status! < 500,
    ));

    // Interceptor para logs (solo en debug)
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      );
    }

    // Interceptor para manejar errores globalmente
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Puedes agregar headers de autenticación aquí
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
    
  }

   // ========== MÉTODO GET ==========
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    T Function(dynamic)? fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        endpoint,
        queryParameters: queryParams,
        options: _buildOptions(headers, options),
      );

      return _handleResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      return _handleDioError<T>(e);
    } catch (e) {
      return ApiResponse.error(
        'Unexpected error: $e',
        0,
      );
    }
  }

  // ========== MÉTODO POST ==========
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    T Function(dynamic)? fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: _buildOptions(headers, options),
      );

      return _handleResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      return _handleDioError<T>(e);
    } catch (e) {
      return ApiResponse.error(
        'Unexpected error: $e',
        0,
      );
    }
  }

  // ========== MÉTODO PUT ==========
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    T Function(dynamic)? fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.put<T>(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: _buildOptions(headers, options),
      );

      return _handleResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      return _handleDioError<T>(e);
    } catch (e) {
      return ApiResponse.error(
        'Unexpected error: $e',
        0,
      );
    }
  }

  // ========== MÉTODO DELETE ==========
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    T Function(dynamic)? fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete<T>(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: _buildOptions(headers, options),
      );

      return _handleResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      return _handleDioError<T>(e);
    } catch (e) {
      return ApiResponse.error(
        'Unexpected error: $e',
        0,
      );
    }
  }

  // ========== MÉTODO PATCH ==========
  Future<ApiResponse<T>> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    T Function(dynamic)? fromJson,
    Options? options,
  }) async {
    try {
      final response = await _dio.patch<T>(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: _buildOptions(headers, options),
      );

      return _handleResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      return _handleDioError<T>(e);
    } catch (e) {
      return ApiResponse.error(
        'Unexpected error: $e',
        0,
      );
    }
  }

  // ========== MÉTODOS PRIVADOS ==========
  Options _buildOptions(
    Map<String, dynamic>? headers, 
    Options? options,
  ) {
    final baseOptions = options ?? Options();
    return baseOptions.copyWith(
      headers: headers != null
          ? {...?baseOptions.headers, ...headers}
          : baseOptions.headers,
    );
  }

  ApiResponse<T> _handleResponse<T>(
    Response<dynamic> response, {
    T Function(dynamic)? fromJson,
  }) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      // Success response
      final responseData = response.data;

      if (responseData == null) {
        return ApiResponse.success(null as T, statusCode);
      }

      if (fromJson != null) {
        final data = fromJson(responseData);
        return ApiResponse.success(data, statusCode);
      } else {
        return ApiResponse.success(responseData as T, statusCode);
      }
    } else {
      // Error response
      final errorMessage = _getErrorMessage(response.data, statusCode);
      return ApiResponse.error(errorMessage, statusCode);
    }
  }

  ApiResponse<T> _handleDioError<T>(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    String errorMessage = 'Unknown error';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Timeout error';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _getErrorMessage(
          error.response?.data,
          statusCode,
        );
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request cancelled';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Network error: ${error.message}';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Bad certificate';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection error';
        break;
    }

    return ApiResponse.error(errorMessage, statusCode);
  }

  String _getErrorMessage(dynamic responseData, int statusCode) {
    try {
      if (responseData == null) {
        return 'HTTP Error $statusCode';
      }

      if (responseData is Map<String, dynamic>) {
        return responseData['message'] ??
            responseData['error'] ??
            'HTTP Error $statusCode';
      } else if (responseData is String) {
        return responseData;
      }

      return 'HTTP Error $statusCode';
    } catch (e) {
      return 'HTTP Error $statusCode';
    }
  }

  // Método para agregar interceptor
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  // Método para actualizar headers por defecto
  void updateBaseOptions({
    String? baseUrl,
    Map<String, dynamic>? headers,
    int? connectTimeout,
    int? receiveTimeout,
  }) {
    _dio.options = _dio.options.copyWith(
      baseUrl: baseUrl ?? _dio.options.baseUrl,
      headers: headers != null
          ? {..._dio.options.headers, ...headers}
          : _dio.options.headers,
      connectTimeout: connectTimeout != null
          ? Duration(milliseconds: connectTimeout)
          : _dio.options.connectTimeout,
      receiveTimeout: receiveTimeout != null
          ? Duration(milliseconds: receiveTimeout)
          : _dio.options.receiveTimeout,
    );
  }
  
}
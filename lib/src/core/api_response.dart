class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;
  final int statusCode;

    ApiResponse({
    required this.success,
    this.data,
    this.error,
    required this.statusCode,
  });

  factory ApiResponse.success(T data, int statusCode) {
    return ApiResponse(
      success: true,
      data: data,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.error(String error, int statusCode) {
    return ApiResponse(
      success: false,
      error: error,
      statusCode: statusCode,
    );
  }

}
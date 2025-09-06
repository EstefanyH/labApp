class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final int statusCode;
  
  ApiResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.statusCode});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse<T>(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      statusCode: json['statusCode']); 
  }
}
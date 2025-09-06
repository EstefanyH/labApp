import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> get(String endpoint) async {
    return await http.get(Uri.parse('$baseUrl/$endpoint'));
  }

  Future<http.Response> post(String endpoint, {Object? body}) async {
    return await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: body
    );
  }

}
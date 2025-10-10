abstract class EndPoints {

  static const String baseUrl = 'https://vivid-carrie-hache-b27df325.koyeb.app/api';

  static const String apiVersion = '/'; // Si tu API tiene versión
  static const String auth = '/auth';
  static const String signIn = '/auth/login';
  // Timeouts
  static const int connectTimeout = 30000; // 30 segundos
  static const int receiveTimeout = 30000; // 30 segundos 
}
class ServerExcepcion implements Exception {
  final String message;
  ServerExcepcion([this.message = 'Ocurrió un error en el servidor.']);

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;
  CacheException([this.message = 'Ocurrió un error al acceder a la caché.']);
  
  @override
  String toString() => 'CacheException: $message';
}
import 'package:applab/src/core/domain/entities/laboratory.dart';

class SearchRepository {
  
  final List<Laboratory> _mockData = [
    Laboratory(Name: 'Laboratorio Daniel', District: 'Lima', Kilometer: '0.8 Km', Address: 'Av. La marina 231', Price: 'S/.12.40'),
    Laboratory(Name: 'Laboratorio Alexander', District: 'Lima', Kilometer: '0.8 Km', Address: 'Av. La marina 231', Price: 'S/.130.40'),
    Laboratory(Name: 'Laboratorio Clinica Suiza', District: 'Lima', Kilometer: '0.8 Km', Address: 'Av. La marina 231', Price: 'S/.90.00'),
    Laboratory(Name: 'Laboratorio Clinica Internacional ', District: 'Lima', Kilometer: '0.8 Km', Address: 'Av. La marina 231', Price: 'S/.300.40')
  ];

  Future<List<Laboratory>> fetchLab() async {
    await Future.delayed(const Duration(microseconds: 500));
    return _mockData;
  }

}
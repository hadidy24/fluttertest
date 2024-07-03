// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiService {
  final baseURL = 'https://jsonplaceholder.typicode.com';
  final Dio dio;
  ApiService({
    required this.dio,
  });
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$baseURL$endPoint");
    return response.data;
  }
}

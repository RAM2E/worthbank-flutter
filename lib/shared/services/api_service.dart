import 'dart:convert';
import 'package:banking_app_frontend/core/constansts/app_constansts.dart';
import 'package:banking_app_frontend/shared/sharedpref/shared_pref.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final token = await SharedPrefs.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token is missing.');
      }

      final url = Uri.parse('${Constants.baseUrl}$endpoint');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      // Returning status code and response body
      return {
        'statusCode': response.statusCode,
        'body': response.statusCode == 200
            ? json.decode(response.body)
            : response.body
      };
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> postbalance(
      String endpoint, Map<String, dynamic> queryParams) async {
    try {
      final token = await SharedPrefs.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token is missing.');
      }

      // Build the URL with query parameters
      final url = Uri.parse('${Constants.baseUrl}$endpoint').replace(
        queryParameters: queryParams, // Adding query parameters to the URL
      );

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      // Returning status code and response body
      return {
        'statusCode': response.statusCode,
        'body': response.statusCode == 200
            ? json.decode(response.body)
            : response.body,
      };
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> get(String endpoint) async {
    try {
      final token = await SharedPrefs.getToken();
      if (token == null || token.isEmpty) {
        // Corrected here
        throw Exception('Authentication token is missing.');
      }

      final url = Uri.parse('${Constants.baseUrl}$endpoint');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return responseBody;
      } else {
        throw Exception('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final token = await SharedPrefs.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token is missing.');
      }

      final url = Uri.parse('${Constants.baseUrl}$endpoint');
      final response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      // Returning status code and response body
      return {
        'statusCode': response.statusCode,
        'body': response.statusCode == 200
            ? json.decode(response.body)
            : response.body
      };
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final token = await SharedPrefs.getToken();
      if (token == null || token.isEmpty) {
        throw Exception('Authentication token is missing.');
      }

      final url = Uri.parse('${Constants.baseUrl}$endpoint');
      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // Returning status code and response body
      return {
        'statusCode': response.statusCode,
        'body': response.statusCode == 200
            ? json.decode(response.body)
            : response.body
      };
    } catch (e) {
      rethrow;
    }
  }
}

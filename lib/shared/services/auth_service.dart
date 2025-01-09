import 'dart:convert';
import 'package:banking_app_frontend/core/constansts/app_constansts.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // Customer login method
  static Future<Map<String, String>> customerLogin(
      String accountId, String password) async {
    final url = Uri.parse('${Constants.baseUrl}/auth/customer/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'accountId': accountId, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return {
          'status': responseData['status'],
          'message': responseData['message'],
          'token': responseData['token'] ?? '',
        };
      } else {
        final responseData = json.decode(response.body);
        return {
          'status': 'error',
          'message': responseData['message'] ?? 'Unknown error occurred',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to connect to the server: ${e.toString()}',
      };
    }
  }

  // Admin login method
  static Future<Map<String, String>> adminLogin(
      String email, String password) async {
    final url = Uri.parse('${Constants.baseUrl}/auth/admin/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return {
          'status': responseData['status'],
          'message': responseData['message'],
          'token': responseData['token'] ?? '',
        };
      } else {
        final responseData = json.decode(response.body);
        return {
          'status': 'error',
          'message': responseData['message'] ?? 'Unknown error occurred',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to connect to the server: ${e.toString()}',
      };
    }
  }
}

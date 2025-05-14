import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2/wtms"; // For Android Emulator
  // If using physical device, use your IP instead of 10.0.2.2

  static Future<bool> registerWorker({
    required String fullName,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    final url = Uri.parse('$baseUrl/register_worker.php');

    final response = await http.post(
      url,
      body: {
        'full_name': fullName,
        'email': email,
        'password': password,
        'phone': phone,
        'address': address,
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result['status'] == 'success';
    } else {
      return false;
    }
  }

  static Future<Map<String, dynamic>?> loginWorker({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login_worker.php');

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result['status'] == 'success') {
        return result['data'];
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
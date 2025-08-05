import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/payment_model.dart';

class KashierRepository {
  final String publicKey;
  final String merchantId;

  KashierRepository({
    required this.publicKey,
    required this.merchantId,
  });

  Future<String> createPaymentSession(KashierPaymentRequest request) async {
    final url = Uri.parse('https://checkout.kashier.io/api/v1/payment/request');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $publicKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200 && body['url'] != null) {
      return body['url']; // Redirect URL
    } else {
      throw Exception('Kashier Error: ${body['message'] ?? 'Unknown error'}');
    }
  }
}

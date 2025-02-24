import 'dart:convert';
import 'package:http/http.dart' as http;
//import '../models/order_model.dart';
import '../remote/api_helper.dart';
import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;







class OrderRepository {
  final http.Client client;

  OrderRepository({required this.client});

  Future<List<Order>> fetchOrders() async {
    final response = await client.post(
      Uri.parse('https://ecommerce.genericartmedicine.com/gobporderdetails.asmx/GetGobpOrderDetails'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"obpuser": "OBP00036"}),
    );

    if (response.statusCode == 200) {
      String responseBody = response.body;

      // 🔥 Extract only the valid JSON list, ignoring anything after it
      int index = responseBody.indexOf(']') + 1;
      if (index > 0) {
        responseBody = responseBody.substring(0, index);
      }

      try {
        List<dynamic> jsonData = jsonDecode(responseBody);
        return jsonData.map((json) => Order.fromJson(json)).toList();
      } catch (e) {
        throw Exception("JSON Parsing Error: $e");
      }
    } else {
      throw Exception("Failed to load orders: ${response.statusCode}");
    }
  }
}

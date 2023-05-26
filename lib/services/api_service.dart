import 'package:http/http.dart' as http;
import 'package:spacexrokets/models/rocketList.dart';
import 'dart:convert';
import 'package:spacexrokets/models/rocket_details.dart';


class APIService {
  static Future<List<Rocket>> getRockets() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v4/rockets'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Rocket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }

  static Future<RocketDetails> getRocketDetails(String rocketId) async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v4/rockets/$rocketId'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json?['id']);
      return RocketDetails.fromJson(json);
    } else {
      throw Exception('Failed to load rocket details');
    }
  }
}

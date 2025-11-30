import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchService {
  final String token = "MASUKKAN_MAPBOX_ACCESS_TOKEN_KAMU";

  Future<List<dynamic>> searchLocation(String query) async {
    final url =
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$token";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["features"];
    } else {
      throw Exception("Failed to search location");
    }
  }
}

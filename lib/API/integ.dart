import 'package:http/http.dart' as http;
import 'package:nameshow/const/linkers.dart';

Future<Map<String, dynamic>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load data');
  }
}

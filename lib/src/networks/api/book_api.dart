import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/book.dart';

class ApiProvider {
  // http://192.168.10.14:1337/parse/classes/Books
  final String _url = "http://192.168.10.14:1337/parse/classes/Books";
  final _urlHeader = {
    'X-Parse-Application-Id': 'myAppId',
    'X-Parse-REST-API-Key': '61894b21be75260c4964065b1eecec4d',
    'Content-Type': 'application/json',
    // 'appid': 'myAppId'
  };

  Future<Book> fetchBookApi() async {
    final response = await http.get(Uri.parse(_url), headers: _urlHeader);
    if (response.statusCode == 200) {
      // print(response.body);
      // var data = json.decode(response.body);
      // print(data);
      return Book.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 403) {
      throw Exception('Can\'t access to api');
    } else {
      throw Exception('Failed to fecth api');
    }
  }
}

//http://192.168.10.29:1337/parse/classes/Books

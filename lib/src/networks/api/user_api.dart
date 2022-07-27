import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class UserApiProvider {
  final String _url = "http://192.168.10.14:1337/parse/Books";
  final _urlHeader = {
    'X-Parse-Application-Id': 'myAppId',
    'X-Parse-REST-API-Key': '61894b21be75260c4964065b1eecec4d',
    'Content-Type': 'application/json',
  };

  Future<User> fetchUserApi() async {
    final response = await http.get(Uri.parse(_url), headers: _urlHeader);
    if (response.statusCode == 200) {
      // var data = json.decode(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 403) {
      throw Exception('Can\'t access to api');
    } else {
      throw Exception('Failed to fetch api');
    }
  }
}

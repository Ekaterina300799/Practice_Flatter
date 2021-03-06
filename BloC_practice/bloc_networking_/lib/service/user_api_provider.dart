import 'dart:convert';

import 'package:bloc_stream/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<List<User>> getUser() async {
    final response =
        await http.get('http://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}

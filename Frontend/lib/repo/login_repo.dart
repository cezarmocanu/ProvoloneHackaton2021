import 'dart:convert';

import 'package:http/http.dart';

class LoginRepo {
  const LoginRepo._internal();

  static const LoginRepo instance = LoginRepo._internal();

  Future<Response> login(String username, String password) async {
    Uri url = Uri.https("hackathon-alexandras.herokuapp.com", "api/login");

    try {
      Response response = await post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: jsonEncode(
          <String, String>{
            'username': username,
            'password': password,
          },
        ),
      );
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
}

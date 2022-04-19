import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:loginwithbloc/auth/login/login_bloc.dart';

class AuthRepository {
  Future<void> login() async {
    print("Attempting Login");
    await Future.delayed(const Duration(seconds: 3));
    print("Logged in");
    throw Exception('Failes Login');
  }

  Future<Response> LoginAPI(email, password) async {
    var url;

    url = Uri.parse("http://36.255.253.10:4201/Login");

    print(url);


    Map data = {
      "USERNAME":email,
      "PASSWORD":password
    };
    print(jsonEncode(data));
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.body);
    return response;

  }
}

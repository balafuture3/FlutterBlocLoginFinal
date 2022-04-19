import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class DashRepository {


  Future<Response> DahboardApi() async {
    var url;

    url = Uri.parse("http://36.255.253.10:9000/main/webmaster/zipcode/select");

    print(url);


    Map data = {
   "":""
    };
    print(jsonEncode(data));
    var response = await http.get(
      url,
      // body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.body);
    return response;

  }
}

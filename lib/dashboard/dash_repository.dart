import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class DashRepository {


  Future<Response> DahboardApi(id) async {
    var url;

    url = Uri.parse("http://36.255.253.10:4201/QuotReportFilter");

    print(url);


    Map data = {
      "docno":id,
      "offset":"0",
      "search":""
    };
    print(jsonEncode(data));
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
    log(response.body);
    return response;

  }
}

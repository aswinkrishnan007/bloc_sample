import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NetworkService {
  Future<dynamic> get(
     Map<String, String> headers, BuildContext context,String name) async {
    dynamic responseJson;
    try {
      final url = Uri.parse(
          "https://pixabay.com/api/?key=28341193-af7c20bffcdb8131e8ab74d58&q=$name&image_type=photo");
      final response = await http.get(url, headers: headers);
      responseJson = _response(response, context);
    } on SocketException {
      throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No internet"),
      ));
    }
    return responseJson;
  }

  dynamic _response(http.Response response, BuildContext context) {
  
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 200:
        return responseJson;
      default:
        throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Something went wrong"),
        ));
    }
  }
}

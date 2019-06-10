import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gframework/common/functions/saveCurrentLogin.dart';
import 'package:gframework/common/functions/showDialogSingleButton.dart';
import 'dart:convert';

import 'package:gframework/models/loginModel.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = "http://192.168.1.216:8000/api/login";

  Map data = {
    'username': username,
    'password': password,
  };

  var body = json.encode(data);

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    print(responseJson);
    var user = new LoginModel.fromJson(responseJson);

    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.",
        "OK");
    return null;
  }
}

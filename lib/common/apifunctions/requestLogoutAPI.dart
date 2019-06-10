import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gframework/common/functions/getToken.dart';
import 'package:gframework/common/functions/saveLogout.dart';
import 'package:gframework/models/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "http://192.168.1.216:8000/logout";

  var token;

  await getToken().then((result) {
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpHeaders.authorizationHeader: "Token $token"},
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}

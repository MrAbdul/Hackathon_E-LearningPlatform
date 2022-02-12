import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';


class Endpoints {
  static const String baseUrl ="http://192.168.156.25:3000";
  static const String student =  "/ss";
  static const String userReviewById = baseUrl + "tutor-rating/byTutor/";

  static const String signUpLink = baseUrl + student;
}

class RequestsController extends GetxController {
  final _client = http.Client();

  

  Future<dynamic> signUp(String username, String password) async {
    var _url = Uri.parse(Endpoints.signUpLink);
    print (_url);
    final Map body = {'username': username, 'password': password};
    print(jsonEncode(body));
    var response = await _client.post(
      _url,
      body: jsonEncode(body),
      headers: {'Content-Type': "application/json",}
    );
    print("SIGNUPT");
    print (response);
    print(response.body.toString());

    return response;
  }

  Future<dynamic>  signIn(String username, String password)async{
       var _url = Uri.parse(Endpoints.signUpLink+"/"+username+"/"+password);
    var response = await _client.post(
      _url,
      headers: {'Content-Type': "application/json"},
    );
    print(response.body.toString());

    return response;
  }
}

import 'package:http/http.dart' as http;
import 'package:test_project/data_model/login_response.dart';
import 'package:test_project/data_model/sign_up_response.dart';
import 'dart:convert';


class AuthRepository{
  Future<LoginResponse> getLoginResponse(
      String email, String password) async {
    var post_body = jsonEncode({
      "username": "$email",
      "password": "$password",
    });

    Uri url = Uri.parse("https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: post_body);
    print(response.body);
    return loginResponseFromJson(response.body);
  }

  Future<SignupResponse> getSignupResponse(
      String name,
      String email,
      String password,

     ) async {
    var post_body = jsonEncode({
      "username": "$name",
      "email": "$email",
      "password": "$password",
    });
    print(name);

    Uri url = Uri.parse("https://apptest.dokandemo.com/wp-json/wp/v2/users/register");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Accept" : "application/json"

        },
        body: post_body);
    print(response.body);

    return signupResponseFromJson(response.body);
  }



}
import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getPhotos() {
    return http.get(Uri.parse("$baseUrl/photos"));
  }

  static Future login(username, password) {
    return http.post(Uri.parse("https://dummyjson.com/auth/login"), body: {
      "username": username,
      "password": password,
    });
  }
}

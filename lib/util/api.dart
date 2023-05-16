import 'package:http/http.dart' as http;

class Api{
  static const String baseUrl = "https://codeit.com.np/api";
  static var headers = {"Accept": "application/json", "Content-Type": "application/json"};
  static var client = http.Client();
}
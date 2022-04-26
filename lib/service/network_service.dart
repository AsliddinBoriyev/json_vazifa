import 'dart:convert';

import '../model/comments.dart';
import '../model/photos.dart';
import '../model/todos.dart';



class NetworkService {
  //URL
  static const String baseUrl = "jsonplaceholder.typicode.com";

  //HEADERS
  static Map<String, String> headers = {
    'Content-type': "application/json; charset=UTF-8",
  };

  //APIS
  // static const String apiPosts = "/comments";
  // static const String apiPost = "/comments/";
  // static const String apiPosts = "/todos";
  // static const String apiPost = "/todos/";
  static const String apiPosts = "/photos";
  static const String apiPost = "/photos/";

  //METHODS
  static Future<String> GET(String api, Map<String, String> headers) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await get(uri, headers: headers);
    if (response.statusCode == 200  response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception("ERROR");
    }
  }

  static Future<String> POST(String api, Map<String, String> headers,
      Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response =
    await post(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200  response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception("Error");
    }
  }

  static Future<String> PUT(String api, Map<String, String> headers,
      Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response =
    await put(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200  response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception("Error");
    }
  }

  static Future<String> PATCH(String api, Map<String, String> headers,
      Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response =
    await patch(uri, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200  response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception("Error");
    }
  }

  static Future<String> DELETE(String api, Map<String, String> headers) async{
    Uri uri = Uri.https(baseUrl, api);
    Response response = await delete(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception("Error");
    }
  }

  //PARSING
  static Future<List<Comments>> parseCommentList(String body) async {
    List json = jsonDecode(body);
    List<Comments> coments = json.map((map) => Comments.fromJson(map)).toList();
    return coments;
  }

  static Future<List<Todos>> parseTodosList(String title) async {
    List json = jsonDecode(title);
    List<Todos> todos = json.map((map) => Todos.fromJson(map)).toList();
    return todos;
  }

  static Future<List<Photos>> parsePhotosList(String title) async {
    List json = jsonDecode(title);
    List<Photos> photos = json.map((map) => Photos.fromJson(map)).toList();
    return photos;
  }
}

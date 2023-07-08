// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'classes.dart';

class ApiService {
  static Future<User> getUser() async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/shamskhaled20/atw-ltd/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  static Future<List<Album>> getAlbums(int userId) async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/shamskhaled20/atw-ltd/albums?userId=$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> albumData = json.decode(response.body);
      return albumData.map((data) => Album.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch albums data');
    }
  }

  static Future<List<Photo>> getPhotos(int albumId) async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/shamskhaled20/atw-ltd/photos?albumId=$albumId'));
    if (response.statusCode == 200) {
      final List<dynamic> photoData = json.decode(response.body);
      return photoData.map((data) => Photo.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch photos data');
    }
  }
}

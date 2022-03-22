import 'dart:convert';

import '../../Photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl  = "https://pixabay.com/api/";
  final key = "26185952-d3d85c0548ef1744a92e07988";
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        "$baseUrl?key=$key&q=$query&image_type=photo"));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse["hits"];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
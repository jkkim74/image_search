import 'dart:convert';

import 'package:image_search/ui/data/photo_api_repository.dart';

import '../../Photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository{
  static const baseUrl  = "https://pixabay.com/api/";
  static const key = "26185952-d3d85c0548ef1744a92e07988";

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();
    final response = await client.get(Uri.parse(
        "$baseUrl?key=$key&q=$query&image_type=photo"));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse["hits"];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
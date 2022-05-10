import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shimmer_example/Model/Universities.dart';

class NetworkClient {

  static String URL = "http://universities.hipolabs.com/search?country=India";

  Future<List<Universities>> getUniversities() async {
    final response = await http
        .get(Uri.parse(URL));


    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;

      // iterate over the list and map each object in list to Img by calling Img.fromJson
      List<Universities> universityList = list.map((i)=>Universities.fromJson(i)).toList();
      return universityList;
    } else {
      throw Exception('Failed to load universities');
    }
  }
}
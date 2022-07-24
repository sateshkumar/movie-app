import 'dart:convert';
import 'dart:io';

import 'package:movie_app/Models/movie_description.dart';
import 'package:movie_app/Models/movie_listining.dart';
import 'package:http/http.dart' as http;
import '../Common/const.dart';

class ApiAuth {
  Movielistining movielistining = Movielistining();
  MovieDescriptionModel movieDescriptionModel = MovieDescriptionModel();

  Future<Movielistining> getMovieListining() async {
    var categoryResult;
    try {
      var url = Uri.parse("${baseUrl}/v1/movies");
      final response = await http.get(url, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });

      print(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('getpostdata ${data}');

        movielistining = Movielistining.fromJson(data);
      } else {
        print('can\'t get data from api');
      }
    } catch (e) {
      print(e);
    }
    return movielistining;
  }

  Future<MovieDescriptionModel> getMovieDetail(String id) async {
    var categoryResult;
    try {
      var url = Uri.parse("${baseUrl}/v1/movies/$id");
      final response = await http.get(url, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });

      print(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('getpostdata ${data}');

        movieDescriptionModel = MovieDescriptionModel.fromJson(data);
      } else {
        print('can\'t get data from api');
      }
    } catch (e) {
      print(e);
    }
    return movieDescriptionModel;
  }
}

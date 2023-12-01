import 'dart:convert';

import 'package:joflex/models/movie.dart';
import 'package:http/http.dart'as http;

class Api{
  static const apiKey='c55d03236ef2a2f10ec819811bab5461';
  Future<List<MovieModel>> getMovies({required  String moviesSection, int page=1})async{
    http.Response response= await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$moviesSection?api_key=$apiKey&page=$page'));
    if(response.statusCode==200){
      List<dynamic> data=jsonDecode(response.body)['results'] ;
      List<MovieModel>movies=[];
     for(int i=0;i<data.length ;i++ ){
      movies.add(MovieModel.fromJson(data[i]));
     }
      return movies;
    }
    else{
      throw Exception('Something went wrong, Please try again later!');
    }
  }
}
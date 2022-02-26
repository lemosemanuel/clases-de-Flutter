
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/map_now_playing_response.dart';
import 'package:peliculas/models/map_popular_response.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey='b8a8b5a17d6617fa6ad022de5d11929d';
  String _baseUrl='api.themoviedb.org';
  String _language='es-ES';

  List<Result> onDisplayMovies=[];
  List<Result> popularMovies=[];
  int _popularPage=0;


  Map<int,List<Cast>> moviesCast={};



  // constructor
  MoviesProvider(){
    print('MoviesProvider Inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }


  Future <String>_getJsonData(String endpoint, [int page=1])async{
    final url = Uri.https(
      _baseUrl, 
      endpoint,
      {
      'api_key':_apiKey,
      'language':_language,
      'page':'$page'      
      }
      );
      final response = await http.get(url);
      return response.body;
  }

  getOnDisplayMovies()async{
    final jsonData= await this._getJsonData('3/movie/now_playing');

    final dataMapeada=MapNowPlayingResponse.fromJson(jsonData);

    // lo convierto de string a json
    // este paso ya lo tengo en el Map de model ahi me lo decodifica
    // final Map<String,dynamic> decodeData= json.decode(response.body);

    // if (response.statusCode!=200) return print('error');

    // print(dataMapeada.results[1].title);
    onDisplayMovies=dataMapeada.results;
    

    // notifica cuando surgio algun cambio
    notifyListeners();
  }


  getPopularMovies()async{
    // incremento el popular page en 1
    _popularPage++;
    final jsonData= await this._getJsonData('3/movie/popular',_popularPage);

    final popularResponse=PopularMapingResponse.fromJson(jsonData);

    // lo convierto de string a json
    // este paso ya lo tengo en el Map de model ahi me lo decodifica
    // final Map<String,dynamic> decodeData= json.decode(response.body);

    // if (response.statusCode!=200) return print('error');

    popularMovies=popularResponse.results;
    

    // notifica cuando surgio algun cambio
    notifyListeners();
  }

  getMovieCast (int movieId)async{
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData= await this._getJsonData('3/movie/$movieId/credits');
    final creditResponse=CreditResponse.fromJson(jsonData);


    moviesCast[movieId]=creditResponse.cast;
    return creditResponse.cast;
  }


  Future <List<Result>>searchMovie(String query)async{
    final url = Uri.https(
      _baseUrl, 
      '3/search/movie',
      {
      'api_key':_apiKey,
      'language':_language,
      'query':query  
      }
      );
      final response = await http.get(url);
      final searchResponse=SearchResponse.fromJson(response.body);

      return searchResponse.results;
  }

}
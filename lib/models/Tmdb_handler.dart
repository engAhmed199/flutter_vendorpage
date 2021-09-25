import 'package:dio/dio.dart';
import 'package:movies/models/Movies.dart';
import 'package:movies/models/geners.dart';
import 'package:movies/models/person.dart';

class Tmdbhandler {
  static Tmdbhandler _instance = Tmdbhandler._private();
  Tmdbhandler._private();
  static Tmdbhandler get instance => _instance;
  String mainurl = 'https://api.themoviedb.org/3';

  Dio _dio = Dio();

  Future<List<Movie>> getnowplaying() async {
    String url = '$mainurl/movie/now_playing';

    final parms = {'api_key': 'e0beb81d6df3f1ac1b6d3da6576d6c1f'};

    Response response= await _dio.get(url,queryParameters: parms);
    
    List<Movie> movies = (response.data['results'] as List).map((movie) {
      return Movie.fromjson(movie);
    }).toList();
    return movies;
  
    
  }
  
  Future<List<Geners>> getgeners() async {
    String url = '$mainurl/genre/movie/list';

    final parms = {'api_key': 'e0beb81d6df3f1ac1b6d3da6576d6c1f'};

    Response response= await _dio.get(url,queryParameters: parms);
    
    List<Geners> geners = (response.data['genres'] as List).map((gener) {
      return Geners.fromjson(gener);
    }).toList();
    return geners;
  
    
  }

Future<List<Movie>> getgenersbyid(int id) async {
    String url = '$mainurl/discover/movie';

    final parms = {'api_key': 'e0beb81d6df3f1ac1b6d3da6576d6c1f','with_genres':id};

    Response response= await _dio.get(url,queryParameters: parms);
    List<Movie> movies = (response.data['results'] as List).map((movie) {
      return Movie.fromjson(movie);
    }).toList();
    return movies;
}
Future<List<Person>> gettrendingperson() async {
  
    String url = '$mainurl/trending/person/week';

    final parms = {'api_key': 'e0beb81d6df3f1ac1b6d3da6576d6c1f'};

    Response response= await _dio.get(url,queryParameters: parms);
    List<Person> persons = (response.data['results'] as List).map((person) {
      return Person.fromjson(person);
    }).toList();
    return persons;

}
Future<List<Movie>> gettrendingmovies() async {
  
    String url = '$mainurl/trending/movie/week';

    final parms = {'api_key': 'e0beb81d6df3f1ac1b6d3da6576d6c1f'};

    Response response= await _dio.get(url,queryParameters: parms);
    List<Movie> movies = (response.data['results'] as List).map((movie) {
      return Movie.fromjson(movie);
    }).toList();
    return movies;

}

}

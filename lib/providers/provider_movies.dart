import 'package:flutter/cupertino.dart';
import 'package:movies/models/Movies.dart';
import 'package:movies/models/Tmdb_handler.dart';

class Moviesprovider with ChangeNotifier{
  List<Movie> nowplayingmovies;
  List<Movie> moviesbygener;
  
  Future<bool> fetchnowplaying() async{
    try{
      nowplayingmovies=await Tmdbhandler.instance.getnowplaying();
      return true;

    }
    catch(error){
      return false;

    }
    
  }
  Future<bool> fetchmoviesbygenerid(int generid) async{
    try{
      moviesbygener=await Tmdbhandler.instance.getgenersbyid(generid);
      return true;

    }
    catch(error){
      return false;

    }
    
  }
  Future<bool> fetchtrendingmovies() async{
    try{
      moviesbygener=await Tmdbhandler.instance.gettrendingmovies();
      return true;

    }
    catch(error){
      return false;

    }
    
  }
}
import 'package:flutter/material.dart';
import 'package:movies/models/Tmdb_handler.dart';
import 'package:movies/models/geners.dart';

class Genersprovider with ChangeNotifier{
  List<Geners> geners;
  
  Future<bool> fetchgeners() async{
    try{
    geners = await Tmdbhandler.instance.getgeners();
    return true;
  }
  catch(error){
    return false;
  }
  }
}
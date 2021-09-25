
import 'package:flutter/material.dart';
import 'package:movies/models/Tmdb_handler.dart';
import 'package:movies/models/person.dart';

class Personnprovider with ChangeNotifier{
  List<Person> persons;
  
  Future<bool> fetchtrendingperson() async{
    try{
    persons = await Tmdbhandler.instance.gettrendingperson();
    return true;
  }
  catch(error){
    return false;
  }
  }
}
  
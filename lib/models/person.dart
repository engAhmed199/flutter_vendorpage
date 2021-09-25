class Person{
  final int id;
  final String name;
  final String posterurl;
  Person.fromjson(dynamic json):this.id=json['id'],this.name=json['name'],this.posterurl='http://image.tmdb.org/t/p/original/${json['profile_path']}';


}
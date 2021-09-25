
class Movie{
final String title,backposter,posterurl;
final double rate;

Movie.fromjson(dynamic json)
  :this.title=json['title'],
  this.rate=json['vote_average'].toDouble(),
  this.backposter='http://image.tmdb.org/t/p/original/${json['backdrop_path']}',
  this.posterurl='http://image.tmdb.org/t/p/original/${json['poster_path']}';
 
  

}
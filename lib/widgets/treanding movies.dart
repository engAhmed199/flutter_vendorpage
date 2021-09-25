import 'package:flutter/material.dart';
import 'package:movies/widgets/trending_movies.dart';

class Treandingmovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Trending movies',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
          width: 200,
          child: Divider(
            color: Theme.of(context).accentColor,
          ),
        ),
        
       Trendingmovies(),
      ],
    );
  }
}

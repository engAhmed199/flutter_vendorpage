import 'package:flutter/material.dart';
import 'package:movies/widgets/treandingperson.dart';

class TreandinACTOR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Trending Actors',
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
        
        Trendingpersonlist(),
      ],
    );
  }
}
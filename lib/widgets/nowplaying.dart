import 'package:flutter/material.dart';
import 'package:movies/providers/provider_movies.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';

class Nowplaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: PageIndicatorContainer(
      
        child: PageView.builder(
          itemCount: 5,
          
          itemBuilder: (context, index) {
          
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height* 0.5,
                child: Image.network(
                Provider.of<Moviesprovider>(context).nowplayingmovies[index].backposter,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.play_circle_outline),
                  color: Colors.red[700],
                  iconSize: 50,
                  onPressed: () {},
                ),
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Theme.of(context).primaryColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0,0.5]
                  ),
                ),
              ),
              Positioned(
                bottom: 45,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                
                  child: Text(
                     Provider.of<Moviesprovider>(context).nowplayingmovies[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      
                      
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
        length: 5,
        shape: IndicatorShape.circle(size: 8),
        indicatorSelectorColor: Theme.of(context).accentColor,
      ),
    );
  }
}

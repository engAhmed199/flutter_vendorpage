import 'package:flutter/material.dart';
import 'package:movies/providers/geners_provider.dart';
import 'package:movies/providers/person_provider.dart';
import 'package:movies/providers/provider_movies.dart';
import 'package:movies/widgets/moviescategory.dart';
import 'package:movies/widgets/nowplaying.dart';
import 'package:movies/widgets/treanding%20movies.dart';
import 'package:movies/widgets/treandingpersonn.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool firstrun;
  bool suc;
  @override
  void initState() {
    super.initState();
    firstrun = true;
    suc = true;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstrun) {
     final responses =await Future.wait([
        Provider.of<Moviesprovider>(context, listen: false).fetchnowplaying(),
        Provider.of<Genersprovider>(context, listen: false).fetchgeners(),
         Provider.of<Personnprovider>(context, listen: false).fetchtrendingperson(),
        Provider.of<Moviesprovider>(context, listen: false).fetchtrendingmovies(),
        
      ]);

      setState(() {
        suc =!responses.any((element) => false);
        firstrun = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.dehaze),
              onPressed: () {},
            ),
            title: Text('Movies'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          body: (firstrun)
              ? Center(child: CircularProgressIndicator())
              : (suc)
                  ? ListView(
                      children: [
                        Nowplaying(),
                        Moviescategory(),
                        Treandingmovies(),
                        TreandinACTOR(),
                      ],
                    )
                  : Center(
                      child: Text('error'),
                    ),
        ));
  }
}

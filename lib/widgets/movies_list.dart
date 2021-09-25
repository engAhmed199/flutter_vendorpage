import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/providers/provider_movies.dart';
import 'package:provider/provider.dart';

class Movieslist extends StatefulWidget {
  final int generid;
  Movieslist.bygenerid(this.generid);

  @override
  _MovieslistState createState() => _MovieslistState();
}

class _MovieslistState extends State<Movieslist> {
  bool firstrun;
  @override
  void initState() {
    super.initState();
    firstrun = true;
  }

  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstrun) {
      await Provider.of<Moviesprovider>(context, listen: false)
          .fetchmoviesbygenerid(widget.generid);
      setState(() {
        firstrun = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5 - 48,
      child: (firstrun)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<Moviesprovider>(context, listen: false)
                  .moviesbygener
                  .length,
              itemExtent: 150,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          Provider.of<Moviesprovider>(context)
                              .moviesbygener[index]
                              .posterurl,
                          fit: BoxFit.cover,
                        ),
                        flex: 7,
                      ),
                      Expanded(
                        child: Text(
                          Provider.of<Moviesprovider>(context)
                              .moviesbygener[index]
                              .title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${Provider.of<Moviesprovider>(context).moviesbygener[index].rate}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            RatingBar(
                              onRatingUpdate: null,
                              allowHalfRating: true,
                              initialRating:
                                  Provider.of<Moviesprovider>(context)
                                      .moviesbygener[index]
                                      .rate,
                              itemSize: 12,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),
  
                    ],
                  ),
                );
              }),
    );
  }
}

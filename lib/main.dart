import 'package:flutter/material.dart';
import 'package:movies/providers/geners_provider.dart';
import 'package:movies/providers/person_provider.dart';
import 'package:movies/providers/provider_movies.dart';
import 'package:movies/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Moviesprovider(),),
        ChangeNotifierProvider(create: (context) => Genersprovider(),),
         ChangeNotifierProvider(create: (context) => Personnprovider(),),   
      ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor:Colors.black ,
          accentColor: Colors.red,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
//Color.fromARGB(29, 25, 24, 1)
//Color.fromARGB(249, 48, 5, 1)

import 'package:flutter/material.dart';
import 'package:movies/assets/list.dart';
import 'package:movies/providers/person_provider.dart';
import 'package:provider/provider.dart';

class Trendingpersonlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5 - 48,
      child: ListView.builder(
        
        
          scrollDirection: Axis.horizontal,
          
          itemCount: Provider.of<Personnprovider>(context).persons.length,
          itemExtent: 200,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  
                  Expanded(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(
                      Provider.of<Personnprovider>(context).persons[index].posterurl,
                      
                      
                    ),

                    ),
                    flex: 8,
                  ),
                  
                  Expanded(
                    child: Center(
                      child: Text(
                       Provider.of<Personnprovider>(context).persons[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    flex: 2,
                  ),
                  
                ],
              ),
            );
          }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:movies/providers/geners_provider.dart';
import 'package:movies/widgets/movies_list.dart';
import 'package:provider/provider.dart';

class Moviescategory extends StatefulWidget {
  @override
  _MoviescategoryState createState() => _MoviescategoryState();
}


class _MoviescategoryState extends State<Moviescategory>with TickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
  
    super.initState();
    tabController=TabController(length:Provider.of<Genersprovider>(context,listen: false).geners.length,vsync: this);
  }
  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Scaffold(
        
        appBar: AppBar(
          toolbarHeight: 48,
          bottom: TabBar(
            
            controller: tabController,
            
            isScrollable: true,
            tabs: Provider.of<Genersprovider>(context).geners.map((e){
              return Tab(text: e.name,);
            }).toList(),

          
           
          ),
        ),
        body: TabBarView(
          
          
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children:  Provider.of<Genersprovider>(context).geners.map((gener){
            return Movieslist.bygenerid(gener.id);
          }).toList(),
 
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // siempre en el build usamos el provider
    final moviesProvider= Provider.of<MoviesProvider>(context,listen: true);

    // print(moviesProvider.onDisplayMovies);


    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en cines"),
        actions: [
          IconButton(
            onPressed: ()=> showSearch(
                context: context, 
                delegate: MovieSearchDelegate())
            , 
            icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            CardSwiper(movies:moviesProvider.onDisplayMovies),
            MovieSlider(
              movies:moviesProvider.popularMovies,
              rubro:'populares',
              onNextPage: ()=>moviesProvider.getPopularMovies(),),
              
            // MovieSlider()

          ],
        ),
      )
    );
  }
}
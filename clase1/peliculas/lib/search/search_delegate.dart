


import 'package:flutter/material.dart';
import 'package:peliculas/models/map_now_playing_response.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'buscar peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query='';
        }, 
        icon:const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  
      IconButton(
        onPressed: (){
          close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
    return  Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return Container(
        child: const Center(
          child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 100,),
        ),
      );
    }
    final moviesProvier=Provider.of<MoviesProvider>(context,listen: false);

    return FutureBuilder(
      future: moviesProvier.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Result>> snapshot){
        if (!snapshot.hasData) 
        return Container(
              child: const Center(
                child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 100,),
              ),
            );
        final movies=snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
            return _MovieItem(movie: movies[index]);
          });
      },

      );
  }

}

class _MovieItem extends StatelessWidget {
  final Result movie;
  const _MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId='search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'), 
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (){
        Navigator.pushNamed(context, 'details',arguments:movie);
      },

    );
  }
}
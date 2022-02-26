import 'package:flutter/material.dart';
import 'package:peliculas/models/map_now_playing_response.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailesScreen extends StatelessWidget {
   
  const DetailesScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
  final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      body: CustomScrollView(
         slivers: [
           _CustomAppBar(movie: movie,),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie:movie),

              _OverView(movie:movie),
              _OverView(movie:movie),
              _OverView(movie:movie),



              CastingCards(movieId:movie.id)

              
              ])
          ),

         ],
      ),
    );
  }
}



// contenedor para la descripcion
class _OverView extends StatelessWidget {
  final Result movie;
  const _OverView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(movie.overview,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}

// titulo de la pelicula
class _PosterAndTitle extends StatelessWidget {
  final Result movie;
  const _PosterAndTitle({
    Key? key, required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                ),
            ),
          ),

          const SizedBox(width:20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ConstrainedBox(
                constraints:BoxConstraints(maxWidth:size.width-190),
                child: Text(movie.title,
                style:Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,),
              ),

              Text(movie.originalTitle,
              style:Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,),


              Row(
                children: [
                  const Icon(Icons.star_outline,size:15,color:Colors.grey),
                  const SizedBox(width: 5,),
                  Text('${movie.voteAverage}',style: Theme.of(context).textTheme.caption,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

// appbar loading
class _CustomAppBar extends StatelessWidget {
  final Result movie;
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title:Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(movie.title,
                            style:TextStyle(fontSize: 16)),
          color: Colors.black45,
          ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackDropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
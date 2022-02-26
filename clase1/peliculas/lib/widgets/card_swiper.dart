import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas/models/map_now_playing_response.dart';




class CardSwiper extends StatelessWidget {
  final List<Result> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      // necesito saber el tama;o de la pantalla
    final sizePantalla= MediaQuery.of(context).size;


    if (this.movies.length==0){
      return Container(
        width: double.infinity,
        height: sizePantalla.height*0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      // tomo todo el ancho posible
      width: double.infinity,
      height: sizePantalla.height * 0.5,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: sizePantalla.width*0.6,
        itemHeight: sizePantalla.height *0.4,
        itemBuilder: (BuildContext context,int index){
          final movie=movies[index];
          // print(movie.posterPath);

          movie.heroId='swiper-${movie.id}';

          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context,'details',arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit:BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
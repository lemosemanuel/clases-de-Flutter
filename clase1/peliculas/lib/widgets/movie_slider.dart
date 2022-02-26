import 'package:flutter/material.dart';

import 'package:peliculas/models/map_now_playing_response.dart';

// lo hago statefull para hacer el scroll infinito , recordar que tenemos el int de las pages
class MovieSlider extends StatefulWidget {
  final List<Result> movies;
  final String? rubro;
  final Function onNextPage;

  const MovieSlider({Key? key, this.rubro,required this.movies, required this.onNextPage}) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController= new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // tamano max del scroll (solo de las peliculas que tengo bajadas), esto es para pedir mas cuando llegue al final
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent-500){
        // llamo al provider
        print('hola');
        widget.onNextPage();

      };
    });
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    final sizePantalla= MediaQuery.of(context).size;


    if (this.widget.movies.length==0){
      return Container(
        width: double.infinity,
        height: sizePantalla.height*0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: 290,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
          child:Text(
            widget.rubro!,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)            
          ),
          SizedBox(height: 15,),
        
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (BuildContext context,int index){
            final movie=widget.movies[index];

              return _MoviePoster(
                movies: movie,
                heroId: '${movie.title}-${index}-${widget.movies[index].id}');
          },
          ),
        )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Result movies;
  final String? heroId;


  const _MoviePoster({
    Key? key, required this.movies, required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movies.heroId=heroId;
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
           GestureDetector(
             onTap: () => Navigator.pushNamed(context, 'details',arguments:movies),
             child: Hero(
               tag: movies.heroId!,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20),
                 child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movies.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                  
                  ),
               ),
             ),
           ),
            Text(movies.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,),
            
        ],
      ),
    );
  }
}
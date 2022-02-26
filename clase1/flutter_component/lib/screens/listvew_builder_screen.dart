import 'package:flutter/material.dart';
import 'package:flutter_component/theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesIds=[3,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController=ScrollController();
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print('${scrollController.position.pixels},${scrollController.position.maxScrollExtent}');
      if ((scrollController.position.pixels+500)>=scrollController.position.maxScrollExtent){
        add5();
      }
    });
  }

  // cuando llegue al final del scroll voy a agragar mas elementos a la lista
  void add5(){
    final lastId=imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e) => lastId+e));
    setState(() {
    });
  }

  // Proseso Async Await
  Future fetchData()async{
    // si esta en true no hagas nada
    if (isLoading) return;
    // como es false ya lo cambio a true y despues sigo
    isLoading=true;
    setState(() {
    });

    await Future.delayed(const Duration(seconds:10));

    add5();
    isLoading=false;
    setState(() {
    });

    // hago que me mueva hacia abajo cuando llego al cargando
    if ((scrollController.position.pixels +100)<= scrollController.position.maxScrollExtent) return;
      scrollController.animateTo(scrollController.position.pixels +120, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn);
  }


  Future <void> onRefresh()async{
    await Future.delayed(const Duration(seconds: 2));
    final lastiId=imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastiId+1);
    add5();
  }

  Widget build(BuildContext context) {

    final sizeScreen=MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        // saco el espacio de arriba y de abajo que dejan las imagenes (la primera y la ultima)
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              // el refresh me vuelve a cargar cuando hago scroll para arriba en el top
              onRefresh: onRefresh ,
              color: AppTheme.primary,
              child: ListView.builder(
                controller: scrollController,
                // va a ir cargando en el index hasta 10
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index){
                  return FadeInImage(
                    // toma todo el ancho posible
                    width: double.infinity,
                    height:300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/500/300?image=${imagesIds[index]}'));
                },
                
                ),
            ),

          
          if (isLoading)
          Positioned(
            left: sizeScreen.width*0.5-30,
            bottom:30,
            child: const _LoadingIcon())
          // else 
          //   Positioned(
          //   left: sizeScreen.width*0.5-30,
          //   bottom:30,
          //   child: Text('Else'))
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(1.0),
      shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
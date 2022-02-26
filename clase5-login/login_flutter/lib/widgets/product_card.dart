import 'package:flutter/material.dart';
import 'package:login_flutter/model/models.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Container(
        margin: EdgeInsets.only(top: 20,bottom: 50),
        width: double.infinity,
        height:400,
        // color: Colors.red,
        decoration: _cardDecorations(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            
            // imagen
            _BackgroundImage(url: product.picture,),

            // titulo y subtitulo
            _ProductDetails(
              titulo: product.name,
              subtitulo: product.name,
              ),

            // precio arriba a la derecha
            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(
                precio: product.price,
              )),

            
            // mostrar de manera condicional solo si esta disponible
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable(aviable:product.avaible))
          ],
          
        ),
      ),
    );
  }

  BoxDecoration _cardDecorations() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0,7))]
      );
  }
}

class _NotAvailable extends StatelessWidget {
  final bool aviable;
  const _NotAvailable({
    Key? key, required this.aviable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            (aviable)?'Disponible':'No Disponible',
          style: const TextStyle(color: Colors.white,fontSize: 20),),
          ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomRight: Radius.circular(25))
        
        ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double precio;

  const _PriceTag({
    Key? key, required this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // el fittedBox ayuda que el texto se adapte al tamano
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text( '\$$precio',style: const TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(25))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  
  const _ProductDetails({
    Key? key, required this.titulo, required this.subtitulo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
        width: double.infinity,
        height: 70,
        // color: Colors.indigo,
        decoration: _titleBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            // titulo
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),
              maxLines:1,
              overflow: TextOverflow.ellipsis),
            // descripcion
            Text(
              subtitulo,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                // fontWeight: FontWeight.bold
                ),
              maxLines:1,
              overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  BoxDecoration _titleBoxDecoration() => BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25))
  );
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage({
    Key? key, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: 
        (url==null)
        ? const Image(
          image: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,)
        :
        FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          // expando la imagen
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
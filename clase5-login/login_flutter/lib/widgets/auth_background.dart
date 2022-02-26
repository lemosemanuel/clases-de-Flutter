import 'package:flutter/material.dart';


class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          
          // hago la caja de arriba
          const _AboveBox(),

          // hago la imgan de arriba
          const _HeaderIcon(),

          
          this.child,

        ],),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin,color: Colors.white,size: 100,),
      ),
    );
  }
}

class _AboveBox extends StatelessWidget {
  const _AboveBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height *0.4,
      decoration: _boxDecotarionBackGround(),
      child: Stack(
        children: const [

          Positioned(
            top: 90,
            left: 30,
            child: _Bubble()
          ),

          Positioned(
            top: -40,
            left: -30,
            child: _Bubble()
          ),

          Positioned(
            top: 20,
            left: 300,
            child: _Bubble()
          ),
          
          Positioned(
            top: 200,
            left: 250,
            child: _Bubble()
          ),

          Positioned(
            top: 280,
            left: 20,
            child: _Bubble()
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecotarionBackGround() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ])
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}
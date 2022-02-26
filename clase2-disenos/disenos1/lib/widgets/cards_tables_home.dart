import 'dart:ui';

import 'package:flutter/material.dart';

class CardsTablesHome extends StatelessWidget {
  const CardsTablesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const[
        
        TableRow(
          children: [
            _SingleCard(color: Colors.cyan, icono: Icons.auto_graph_outlined, texto: 'TopCripto',),
            _SingleCard(color: Colors.blue, icono: Icons.android_sharp, texto: 'BotAI',),
        ]),

        TableRow(
          children: [
            _SingleCard(color: Colors.purpleAccent, icono: Icons.transform_rounded, texto: 'Transferir',),
            _SingleCard(color: Colors.orange, icono: Icons.wallet_giftcard, texto: 'billetera',),
        ]),

        TableRow(
          children: [
            _SingleCard(color: Colors.indigo, icono: Icons.attach_money_outlined, texto: 'Facturado',),
            _SingleCard(color: Colors.green, icono: Icons.people, texto: 'Agenda',),
        ]),

        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icono: Icons.ac_unit, texto: 'Data',),
            _SingleCard(color: Colors.red, icono: Icons.wallet_giftcard, texto: 'billetera',),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icono;
  final Color color;
  final String texto;

  const _SingleCard({Key? key, required this.icono,required this.color, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var column = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icono),
                  radius: 30,
                ),
                const SizedBox(height: 10,),
                Text( texto ,style: TextStyle(color: color,fontSize: 18),)
              ],
            );
    return _CardBackground(child: column);
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(  
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            // margin: const EdgeInsets.all(15),
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
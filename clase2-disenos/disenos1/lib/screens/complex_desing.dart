import 'package:disenos1/widgets/backgroud.dart';
import 'package:disenos1/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ComplexDesingScreen extends StatelessWidget {
   
  const ComplexDesingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:const [
          Background(),
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        children: const [
          // titulo del home
          PageTitle(),

          // cartas de home
          CardsTablesHome()
        ],
      ) ,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_component/theme/app_theme.dart';


class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:[
        ListTile(
          leading: Icon(Icons.card_giftcard,color:AppTheme.primary),
          title: Text('Soy un titulo'),
          subtitle: Text('Laboris ex eu voluptate velit ullamco voluptate velit ex sit minim dolore.'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){}, child: const Text('Cancel')),
              TextButton(onPressed: (){}, child: const Text('ok')),
            ],
          ),
        )
      ],
      ),
    );
  }
}
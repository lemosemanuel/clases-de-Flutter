import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatars"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: const Text("SL"),
              backgroundColor: Colors.indigo[900],
            ),
          ),
        ],
      ),
      body: const Center(
         child: CircleAvatar(
           maxRadius: 110,
           backgroundImage: NetworkImage('https://static.wikia.nocookie.net/spiderman/images/8/87/Stan_Lee.png/revision/latest/top-crop/width/360/height/450?cb=20131218184054&path-prefix=es') ,),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MenuBarBeforePlaytimeWorkout extends StatelessWidget {
  const MenuBarBeforePlaytimeWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border),color: Colors.white,iconSize: 30,),
          IconButton(onPressed: (){}, icon: Icon(Icons.mode_comment_outlined),color: Colors.white,iconSize: 30,),
          IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined),color: Colors.white,iconSize: 30,),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings),color: Colors.white,iconSize: 30,),
          IconButton(onPressed: (){}, icon: Icon(Icons.play_circle),color: Colors.green,iconSize: 60,),
        ],
      ),
    );
  }
}

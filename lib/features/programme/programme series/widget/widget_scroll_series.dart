import 'package:flutter/material.dart';
import 'package:krives_project/features/programme/programme%20series/widget/card_custom_exo.dart';

class WidgetScrollSeries extends StatelessWidget {
  const WidgetScrollSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          padding: EdgeInsets.fromLTRB(8, 10, 0, 32),
          itemBuilder: (context, index){
            return CardCustomExo(index: index,);
          }),
    );
  }
}

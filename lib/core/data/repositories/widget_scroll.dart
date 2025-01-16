import 'package:flutter/material.dart';

class WidgetScroll extends StatelessWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double height;
  final int itemCount;
  final Widget cardCustom;

  const WidgetScroll({
    super.key,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.itemCount =5,
    required this.height,
    required this.cardCustom,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
          padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          itemBuilder: (context, index){
            return cardCustom;
      }),
    );
  }
}

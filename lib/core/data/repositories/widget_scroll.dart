import 'package:flutter/material.dart';

class WidgetScroll extends StatelessWidget {
  static const EdgeInsets _defaultPadding = EdgeInsets.fromLTRB(0, 0, 0, 0);

  final EdgeInsets padding;
  final double height;
  final int itemCount;
  final Widget cardCustom;

  const WidgetScroll({
    super.key,
    this.padding = _defaultPadding,
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
          padding: padding,
          itemBuilder: (context, index){
            return cardCustom;
      }),
    );
  }
}

import 'package:flutter/material.dart';

class Rectangle20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 180,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.82, -0.58),
              end: Alignment(-0.82, 0.58),
              colors: [Colors.black.withOpacity(0), Color(0xFF1DDA63)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
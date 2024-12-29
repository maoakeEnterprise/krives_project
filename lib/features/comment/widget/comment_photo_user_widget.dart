import 'package:flutter/material.dart';

class CommentPhotoUserWidget extends StatelessWidget {
  const CommentPhotoUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29,
      height: 29,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

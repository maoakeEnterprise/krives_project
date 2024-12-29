import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/comment/widget/comment_center_widget.dart';
import 'package:krives_project/features/comment/widget/comment_like_widget.dart';
import 'package:krives_project/features/comment/widget/comment_photo_user_widget.dart';

class CommentSectionWidget extends StatelessWidget {
  const CommentSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 18,),
          CommentPhotoUserWidget(),
          Expanded(child: CommentCenterWidget()),
          SizedBox(width: 7,),
          CommentLikeWidget(),
          SizedBox(width: 18,),
        ],
      ),
    );
  }
}

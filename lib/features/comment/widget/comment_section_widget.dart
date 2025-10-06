import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/features/comment/widget/comment_center_widget.dart';
import 'package:krives_project/features/comment/widget/comment_like_widget.dart';
import 'package:krives_project/features/comment/widget/comment_photo_user_widget.dart';

class CommentSectionWidget extends StatelessWidget {
  final Map<String, String> listPseudo;
  final Commentaries commentaries;
  final Commentary commentary;
  final String pseudo;
  const CommentSectionWidget({super.key, required this.commentary, required this.pseudo, required this.commentaries, required this.listPseudo});

  @override
  Widget build(BuildContext context) {
    //int themeChoice = 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 18,),
          CommentPhotoUserWidget(),
          Expanded(child: CommentCenterWidget(commentary: commentary,pseudo: pseudo,)),
          SizedBox(width: 7,),
          CommentLikeWidget(commentary: commentary, pseudo: listPseudo, commentaries: commentaries,),
          SizedBox(width: 18,),
        ],
      ),
    );
  }
}

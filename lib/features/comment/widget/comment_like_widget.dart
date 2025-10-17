import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/comment/services/comment_action_services.dart';
import 'package:krives_project/features/comment/services/comment_services.dart';

class CommentLikeWidget extends StatelessWidget {
  final Commentary commentary;
  final Map<String, String> pseudo;
  final Commentaries commentaries;
  final List<String> idPrintSubComment;
  const CommentLikeWidget({super.key, required this.commentary, required this.pseudo, required this.commentaries, required this.idPrintSubComment});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return Column(
        children: [
          SizedBox(height: 10,),
          IconButton(
            onPressed: CommentActionServices.isLikedAction(context, commentary, commentaries, pseudo, idPrintSubComment),
            icon: Icon(
              CommentServices.isLikedCommentIcons(commentary),
              color: CommentServices.isLikedCommentColoration(commentary, themeChoice),
              size: 18,
            ),
          ),
          Text(commentary.getLengthLike(),style: ThemesTextStyles.themes[12][themeChoice],),
        ]);
  }
}

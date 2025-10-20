import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/comment/bloc/bloc_comment/comment_bloc.dart';
import 'package:krives_project/features/comment/services/comment_action_services.dart';
import 'package:krives_project/features/comment/services/comment_services.dart';

class CommentCenterWidget extends StatelessWidget {
  final Commentary commentary;
  final Commentaries commentaries;
  final String pseudo;
  final FocusNode focusNode;
  final List<String> idPrintSubComment;
  const CommentCenterWidget({super.key, required this.commentary, required this.pseudo, required this.commentaries, required this.focusNode, required this.idPrintSubComment});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            children: [
              SizedBox(width: 7,),
              Text(pseudo,style: ThemesTextStyles.themes[5][themeChoice],),
              SizedBox(width: 14,),
              Text("${commentary.getTimeWhenPosted()} ${commentary.getTheRightTime(langageChoice)}",style: ThemesTextStyles.themes[4][themeChoice],),
            ]),
        SizedBox(height: 7,),
        Row(
          children: [
            SizedBox(width: 7,),
            Flexible(
              child: Text(commentary.commentary,
                softWrap: true,
                maxLines: 400,
                overflow: TextOverflow.clip,
                style: ThemesTextStyles.themes[3][themeChoice],
              ),
            ),
          ],
        ),
        SizedBox(height: 7,),
        Row(
          children: [
            SizedBox(width: 7,),
            CommentServices.canGetTheButtonAnswerOnSubComment(commentary) ?
            InkWell(
              radius: 0,
              onTap: CommentActionServices.actionAnswerUnderComment(context, focusNode, commentary.id),
              child: Text(SourceLangage.baseLangage[26][langageChoice],style: ThemesTextStyles.themes[12][themeChoice],),
            ) : Container(),
          ],
        ),
        SizedBox(height: 7,),
        CommentServices.thereIsOtherAnswer(commentary, commentaries, idPrintSubComment) ? Row(
            children: [
              Container(height: 1,
                width: 30,
                color: ThemesColor.themes[3][themeChoice],
              ),
              SizedBox(width: 7,),
              BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  return InkWell(
                    radius: 0,
                    onTap: CommentActionServices.actionPrintSubComment(commentary.id, state, context),
                    child: Text(
                      CommentServices.getRightTextForOtherAnswer(commentary, commentaries, langageChoice),
                      style: ThemesTextStyles.themes[12][themeChoice],),
                  );
                  },
              ),
            ]) : Container(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/comment/bloc/bloc_answer_comment/bloc_answer_comment_bloc.dart';
import 'package:krives_project/features/comment/services/comment_action_services.dart';
import 'package:krives_project/features/comment/widget/comment_photo_user_widget.dart';

class CommentTextField extends StatelessWidget {
  final String idProgram;
  final FocusNode focusNode;
  const CommentTextField({super.key, required this.idProgram, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        SizedBox(width: 12,),
        CommentPhotoUserWidget(),
        SizedBox(width: 12,),
        Expanded(
          child: BlocBuilder<AnswerCommentBloc, AnswerCommentState>(
            builder: (context, state) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                style: ThemesTextStyles.themes[7][themeChoice],
                cursorColor: ThemesColor.themes[7][themeChoice],
                onSubmitted: (value) => CommentActionServices.isUnderCommentOnSubmit(state, context, value, idProgram, state is AnswerToTheComment ? state.idCommentary : ""),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: SourceLangage.baseLangage[27][langageChoice],
                  hintStyle: ThemesTextStyles.themes[4][themeChoice],
                ),
              );
              },
          ),
        ),
        BlocBuilder<AnswerCommentBloc, AnswerCommentState>(
          builder: (context, state) {
            return IconButton(
                onPressed: CommentActionServices.isUnderCommentAction(state, context, controller, idProgram, state is AnswerToTheComment ? state.idCommentary : ""),
                icon: Icon(Icons.send,color: ThemesColor.themes[7][themeChoice],
                ));
            },
        )
      ],
    );
  }
}

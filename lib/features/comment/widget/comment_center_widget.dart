import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/comment/bloc/bloc_user_comment/user_comment_bloc.dart';

class CommentCenterWidget extends StatefulWidget {
  final Commentary commentary;
  const CommentCenterWidget({super.key, required this.commentary});

  @override
  State<CommentCenterWidget> createState() => _CommentCenterWidgetState();
}

class _CommentCenterWidgetState extends State<CommentCenterWidget> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserCommentBloc>().add(InitGetUser(idUser: widget.commentary.idUser));
  }
  
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
              BlocConsumer<UserCommentBloc, UserCommentState>(
                listener: (context, state) {
                  // TODO: implement listener
                  },
                builder: (context, state) {
                  if(state is UserCommentLoaded){
                    return Text(state.pseudo,style: ThemesTextStyles.themes[5][themeChoice],);
                  }
                  return Text(" ",style: ThemesTextStyles.themes[5][themeChoice],);
                  },
              ),
              SizedBox(width: 14,),
              Text("${widget.commentary.getTimeWhenPosted()} ${widget.commentary.getTheRightTime()}",style: ThemesTextStyles.themes[4][themeChoice],),
            ]),
        SizedBox(height: 7,),
        Row(
          children: [
            SizedBox(width: 7,),
            Flexible(
              child: Text(widget.commentary.commentary,
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
            Text(SourceLangage.baseLangage[26][langageChoice],style: ThemesTextStyles.themes[12][themeChoice],),
          ],
        ),
        SizedBox(height: 7,),
        Row(
            children: [
              Container(height: 1,
                width: 30,
                color: ThemesColor.themes[3][themeChoice],
              ),
              SizedBox(width: 7,),
              Text("Voir 5 autre réponses",style: ThemesTextStyles.themes[12][themeChoice],),
            ])
      ],
    );
  }
}

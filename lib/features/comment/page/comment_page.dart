import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/comment/bloc/bloc_comment/comment_bloc.dart';
import 'package:krives_project/features/comment/widget/comment_section_widget.dart';
import 'package:krives_project/features/comment/widget/comment_text_field.dart';
import 'package:krives_project/features/comment/widget/stick_widget.dart';
import 'package:krives_project/features/comment/widget/title_widget.dart';

class CommentPage extends StatefulWidget {
  final Program program;
  const CommentPage({super.key, required this.program});

  @override
  State<CommentPage> createState() => _CommentPageState();


}

class _CommentPageState extends State<CommentPage> {

  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(CommentLoad(idProgram: widget.program.id));
  }

  @override
  Widget build(BuildContext context) {
    int themeChoice=0;
    return DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 0.2,
        builder: (context, scrollController){
      return Column(
        children: [
          SizedBox(height: 7,),
          StickWidget(),
          SizedBox(height: 12,),
          TitleWidget(),
          SizedBox(height: 12,),
          Divider(color: ThemesColor.themes[3][themeChoice],),
          BlocBuilder<CommentBloc, CommentState>(
            builder: (context, state) {
              if(state is CommentLoaded)
                {
                  return Expanded(child: ListView.builder(
                      itemCount: state.commentaries.getLength(),
                      itemBuilder: (context, index) => CommentSectionWidget(commentary: state.commentaries.getCommentary(index),)),
                  );
                }
              if(state is CommentError){
              }
              return Container();
            },
),
          Divider(color: ThemesColor.themes[3][themeChoice],),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: CommentTextField(idProgram: widget.program.id,),
          ),
          SizedBox(height: 12,),
        ],
      );
    });
  }
}

void showComment(BuildContext context, int themesChoice,int langageChoice, Program program) {
  showModalBottomSheet(
      context: context,
      backgroundColor: ThemesColor.themes[0][themesChoice],
      scrollControlDisabledMaxHeightRatio: 0.9,
      barrierLabel: SourceLangage.baseLangage[19][langageChoice],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context){
        return CommentPage(program: program,);
      });
}

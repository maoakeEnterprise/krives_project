import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/comment/widget/comment_section_widget.dart';
import 'package:krives_project/features/comment/widget/comment_text_field.dart';
import 'package:krives_project/features/comment/widget/stick_widget.dart';
import 'package:krives_project/features/comment/widget/title_widget.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

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
          Expanded(
              child: ListView(
                children: [
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                  CommentSectionWidget(),
                ],
              )
          ),
          Divider(color: ThemesColor.themes[3][themeChoice],),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: CommentTextField(),
          ),
          SizedBox(height: 12,),
        ],
      );
    });
  }
}

void showComment(BuildContext context, int themesChoice,int langageChoice) {
  showModalBottomSheet(
      context: context,
      backgroundColor: ThemesColor.themes[0][themesChoice],
      scrollControlDisabledMaxHeightRatio: 0.9,
      barrierLabel: SourceLangage.baseLangage[19][langageChoice],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context){
        return CommentPage();
      });
}

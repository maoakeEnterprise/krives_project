import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/features/hub_communautaire/bloc/sort_by/sort_by_bloc.dart';

class ButtonSortBy extends StatelessWidget {
  final String text;

  const ButtonSortBy({
    required this.text,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    int langageChoice = 0;
    Map<String, String> mapTitle = {
      "like": SourceLangage.titlePopUpFilterLangage[2][langageChoice],
      "date": SourceLangage.titlePopUpFilterLangage[3][langageChoice],
      "commentaire": SourceLangage.titlePopUpFilterLangage[4][langageChoice],
    };
    int buttonIndex = mapTitle.keys.toList().indexOf(text);
    return GestureDetector(
      onTap: () {
        context.read<SortByBloc>().add(SortByEventPressed(buttonIndex));
      },
      child: BlocBuilder<SortByBloc, SortByState>(
        builder: (context, state) {
          bool isSelected = _isSelected(state, buttonIndex);
          return Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ThemesColor.themes[1][themeChoice],
              border: Border.all(
                  color: isSelected ? ThemesColor.themes[4][themeChoice] : ThemesColor.themes[1][themeChoice],
                  width: isSelected ? 1 : 0),
            ),
            child: Text(mapTitle[text] != null
                ? mapTitle[text]!
                : "This text is not found",
              style: ThemesTextStyles.themes[3][themeChoice],),
          );
        },
      ),
    );
  }
  bool _isSelected(SortByState state,int index) {
    return state is SortByStateSuccess && state.index == index;
  }
}

import 'package:flutter/material.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/popup_filters/widget/button_sort_by.dart';
import 'package:krives_project/features/popup_filters/widget/mini_title_pop_up_filter.dart';
import 'package:krives_project/features/popup_filters/widget/title_pop_up_filter.dart';

class PopUpFilter extends StatelessWidget {
  const PopUpFilter({super.key});

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;
    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxWidth: 500,maxHeight: 300),
        decoration: BoxDecoration(
          color: ThemesColor.themes[0][chooseThemes],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitlePopUpFilter(),
              MiniTitlePopUpFilter(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonSortBy(text: "like"),
                    SizedBox(height: 7,),
                    ButtonSortBy(text: "date"),
                    SizedBox(height: 7,),
                    ButtonSortBy(text: "commentaire"),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

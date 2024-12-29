import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/route_argument.dart';
import 'package:krives_project/core/functions/function.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/exercice/exercice_main/bloc/switch_edit_exo_bloc.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_delete.dart';

class CardCustomExercise extends StatelessWidget {
  const CardCustomExercise({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return CardCustomColor1(
      width: 380,
      height: 170,
      left: 19,
      child: Row(
        children: [
          SizedBox(width: 22,),
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 22,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150,),
                  BlocBuilder<SwitchEditExoBloc, SwitchEditExoState>(
                    builder: (context, state) {
                      bool isEditResponse = _isEdit(state);
                      return IconButton(
                        onPressed: isEditResponse ? _settingsOnPressed(context) : _deleteOnPressed(context),
                        icon: Icon(isEditResponse ? Icons.settings : Icons.delete,
                          size: 20,
                          color: ThemesColor.themes[7][themeChoice],),
                      );
                    },
                  ),
                ],
              ),
              Text("Push up", style: ThemesTextStyles.themes[5][themeChoice],),
              SizedBox(height: 10,),
              Text("Muscle : My cock", style: ThemesTextStyles.themes[3][themeChoice],),
              SizedBox(
                width: 190,
                child: Text(
                  "Il s'agirait de mettre les deux bras par terre hehe ",
                  style: ThemesTextStyles.themes[4][themeChoice],
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
  IconButton _switchEditExoButton(BuildContext context, SwitchEditExoState state) {
    return IconButton(
      onPressed: (){},
      icon: Icon(Icons.error),
    );
  }
  bool _isEdit(SwitchEditExoState state){
    return state is SwitchEditExoOff;
  }
  VoidCallback _settingsOnPressed(BuildContext context){
    return (){
      navigateToPage(context, 'exercise', RouteArgument(
          titlePage: "Nom Exercice", isCreateButton: true));
    };
  }
  VoidCallback _deleteOnPressed(BuildContext context){
    return (){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return PopUpDelete();
          }
      );
    };
  }
}

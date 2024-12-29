import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/home/widget/mini_card_exercise.dart';
import 'package:krives_project/features/popup_dialog/page/pop_up_delete.dart';

class CardCustomHome extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onTap2;
  final bool isEdit;

  const CardCustomHome({
    this.onTap2,
    this.onTap,
    this.isEdit=false,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    onTapDelete(){showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return PopUpDelete();
        }
    );
    }
    return GestureDetector(
      onTap: onTap2,
      child: CardCustomColor1(
          width: 250,
          height: 180,
          left: 16,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 15, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My workout Name", style: ThemesTextStyles.textBoldWhite),
                    BlocBuilder<SwitchEditBloc, SwitchEditState>(
                      builder: (context, state) {
                        IconData icon = Icons.settings;
                        VoidCallback onTapInit;

                        onTapInit = (state is SwitchEditStateOff && isEdit? onTap : onTapDelete)!;
                        icon = state is SwitchEditStateOff ? Icons.settings : Icons.delete;
                        if(isEdit){
                          return GestureDetector(
                            onTap: onTapInit,
                            child: Icon(icon, size: 24,
                              color: ThemesColor.white,),
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    MiniCardExercise(),
                    SizedBox(width: 13,),
                    MiniCardExercise(),
                    SizedBox(width: 13,),
                    MiniCardExercise(),
                    SizedBox(width: 13,),
                  ],
                ),
                SizedBox(height: 9,),
                Row(
                  children: [
                    MiniCardExercise(),
                    SizedBox(width: 13,),
                    MiniCardExercise(),
                    SizedBox(width: 13,),
                    MiniCardExercise(),
                    SizedBox(width: 13,),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

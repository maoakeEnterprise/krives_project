import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:krives_project/features/home/widget/mini_card_exercise.dart';

class CardCustomHome extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isCanBeEditByTheUserInTheHomePage;
  final bool isOwnedByTheUser;

  const CardCustomHome({
    this.onTap,
    this.isCanBeEditByTheUserInTheHomePage=false,
    this.isOwnedByTheUser=false,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    onTapDelete(){
    }
    return GestureDetector(
      onTap: (){
        context.read<SwitchEditBloc>().add(SwitchEditEventInitPressed());
        if(isOwnedByTheUser){

        }
        else{

        }
        ButtonActionServices.navigateToPage(context, 'before_workout_playtime', RouteArgument(titlePage: "Nom Programme"));
      },
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

                        onTapInit = (state is SwitchEditStateOff && isCanBeEditByTheUserInTheHomePage? onTap : onTapDelete)!;
                        icon = state is SwitchEditStateOff ? Icons.settings : Icons.delete;
                        if(isCanBeEditByTheUserInTheHomePage){
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

import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/argument/route_argument.dart';
import 'package:krives_project/core/services/button_action_services.dart';
import 'package:krives_project/core/theme/themes_text_styles.dart';
import 'package:krives_project/core/data/repositories/card_custom_color1.dart';
import 'package:krives_project/features/hub_communautaire/widget/grid_view_vertical_hub_commu.dart';

class CardWidgetScrollWidgetHorizental extends StatelessWidget {
  const CardWidgetScrollWidgetHorizental({super.key});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return GestureDetector(
      onTap: (){
        ButtonActionServices.navigateToPage(context, 'before_workout_playtime', RouteArgument(titlePage: "Nom Programme"));
      },
      child: CardCustomColor1(
        width: 250,
        height: 180,
        top: 28, right: 19, bottom: 20,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Workout Name",style: ThemesTextStyles.themes[5][themeChoice],),
              GridViewVerticalHubCommu(),
              Row(
                children: [
                  Spacer(),
                  Icon(Icons.favorite_border,color: Colors.white,),
                  SizedBox(width: 5,),
                  Text("2300 likes",style: ThemesTextStyles.themes[5][themeChoice],),
                  SizedBox(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

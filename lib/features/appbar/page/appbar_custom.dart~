import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/theme.dart';
import 'package:krives_project/features/appbar/bloc/action_button/action_button_bloc.dart';
import 'package:krives_project/features/appbar/widget/action_button.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;//title of the page
  final bool isCreateExoButton;//false = edit, true = button check
  final bool isCreateSeriesButton;//false = edit, true = button check
  final bool isProgramButton;//false = nothing , true = button delete

  const AppBarCustom({
    super.key,
    required this.title,
    this.isCreateExoButton = false,
    this.isCreateSeriesButton = false,
    this.isProgramButton = false,
  });

  @override
  Widget build(BuildContext context) {
    int chooseThemes = 0;

    return AppBar(
      elevation: 5,
      title: Text(title, style: ThemeCustom.textThemes[7][chooseThemes]),
      centerTitle: true,
      actions: [
        if(isCreateSeriesButton)
          ActionButton(iconName: 'check_series',),
        if(isCreateExoButton)
          ActionButton(iconName: 'check_exercice',),
        if(isProgramButton)
          ActionButton(iconName: 'delete_program',),
        if(!isCreateExoButton && !isCreateSeriesButton)
        BlocBuilder<ActionButtonBloc, ActionButtonState>(
          builder: (context, state) {
            String buttonName;
            buttonName = _getTheRightActionButton(context, state);
            return buttonName != 'null' ? ActionButton(iconName: buttonName,) : Container();
          },
        ),
      ],
    );
  }

  String _getTheRightActionButton(BuildContext context, ActionButtonState state) {
    if(state is ActionButtonEdit) {return 'edit';}
    else if(state is ActionButtonDelete) {return 'delete';}
    else if(state is ActionButtonValidate) {return 'check';}
    return 'null';
    
  }
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
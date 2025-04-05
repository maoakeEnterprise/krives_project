import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/signup/bloc/radio_button_gender_bloc.dart';
import 'package:krives_project/features/signup/services/sign_up_action_services.dart';
import '../../../core/theme/themes_text_styles.dart';

class ButtonSignUpValidate extends StatelessWidget {
  final String? labelText;
  final Map<String, TextEditingController> textEditingController;

  const ButtonSignUpValidate(
      {super.key, required this.labelText, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonGenderBloc, RadioButtonGenderState>(
      builder: (context, state) {
        return InkWell(
          onTap: SignUpActionServices.signUp(textEditingController,state,context),
          child: Ink(
            child: Container(
              margin: EdgeInsets.fromLTRB(41, 0, 41, 0),
              height: 43,
              constraints: BoxConstraints(
                  maxWidth: 500
              ),
              decoration: BoxDecoration(
                color: ThemesColor.green1,
                borderRadius: BorderRadius.circular(21.5),
              ),
              child: Center(
                child: Text(labelText!,
                  style: ThemesTextStyles.textBigBoldBlack,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
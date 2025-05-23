import 'package:flutter/material.dart';
import 'package:krives_project/core/data/repositories/card_custom_add.dart';
import 'package:krives_project/features/exercice/services/exercise_action_services.dart';

class CardCustomAddExo extends StatefulWidget {
  const CardCustomAddExo({super.key});

  @override
  State<CardCustomAddExo> createState() => _CardCustomAddExoState();
}

class _CardCustomAddExoState extends State<CardCustomAddExo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CardCustomAdd(
      height: 110,
      left: 20,
      onTap: ExerciseActionServices.addNewExercise(context, _nameController, _videoController),
    );
  }
}

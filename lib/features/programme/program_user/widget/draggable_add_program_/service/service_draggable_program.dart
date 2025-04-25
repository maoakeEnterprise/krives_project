import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/programme/program_user/widget/draggable_add_program_/bloc/add_prog_pop_bloc.dart';

class ServiceDraggableProgram {

  static VoidCallback actionToAddProgramInFolder(BuildContext context, String nameFolder, Program program) {
    return ()async {
      context.read<AddProgPopBloc>().add(PopProgramAdd(nameFolder: nameFolder, program: program));
    };
  }

}
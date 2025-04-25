import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/theme/themes_color.dart';
import 'package:krives_project/features/programme/program_user/bloc/program_bloc/program_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/draggable_add_program_/bloc/add_prog_pop_bloc.dart';
import 'package:krives_project/features/programme/program_user/widget/draggable_add_program_/widget/tiles_draggable.dart';

class DraggableAddProgramPage extends StatelessWidget {
  final String nameFolder;

  const DraggableAddProgramPage({super.key, required this.nameFolder});

  @override
  Widget build(BuildContext context) {
    int themeChoice = 0;
    return BlocListener<AddProgPopBloc, AddProgPopState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is PopProgramsSend){
          Navigator.of(context).pop();
          context.read<ProgramBloc>().add(ProgramInitial(nameFolder: nameFolder));
        }
      },
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 0.2,
        builder: (context, scrollController) {
          return Column(
            children: [
              SizedBox(height: 7,),
              Container(
                height: 5,
                width: 43,
                decoration: BoxDecoration(
                  color: ThemesColor.themes[7][themeChoice],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: 12,),
              SizedBox(height: 12,),
              Divider(color: ThemesColor.themes[3][themeChoice],),
              BlocBuilder<AddProgPopBloc, AddProgPopState>(
                builder: (context, state) {
                  if (state is PopProgramsLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is PopProgramsLoaded) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.programs.length,
                          itemBuilder: (context, index) {
                            return TilesDraggableProgram(
                              program: state.programs[index],
                              nameFolder: nameFolder,);
                          }),
                    );
                  }
                  return Container();
                },
              )
            ],
          );
        },
      ),
    );
  }
}

class ShowDraggableProgram {
  static void showDraggableProgram(BuildContext context, int themeChoice,
      String nameFolder) {
    showModalBottomSheet(
        context: context,
        backgroundColor: ThemesColor.themes[0][themeChoice],
        scrollControlDisabledMaxHeightRatio: 0.9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return DraggableAddProgramPage(nameFolder: nameFolder,);
        });
  }
}

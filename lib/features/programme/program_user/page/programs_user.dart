import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';
import 'package:krives_project/core/services_action/program_action_services.dart';
import 'package:krives_project/features/programme/program_user/bloc/folder_bloc/folder_bloc.dart';

class ProgramsUser extends StatefulWidget {
  final bool isInFolder;
  const ProgramsUser({
    super.key,
    this.isInFolder=false
  });

  @override
  State<ProgramsUser> createState() => _ProgramsUserState();
}

class _ProgramsUserState extends State<ProgramsUser> {
  late Folder folder;

  @override
  void initState() {
    folder = Folder.initClass();
    context.read<FolderBloc>().add(FolderInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return widget.isInFolder ? _buildProgramBlocConsumer() :_buildFolderBlocConsumer() ;
  }

  Widget _buildFolderBlocConsumer() {
    return BlocConsumer<FolderBloc, FolderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is FolderLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is FolderLoaded){
          folder = state.folder;
          return ListView.builder(
            itemCount: folder.folders.length+1,
            itemBuilder: (context, index) {
              return ProgramActionServices.getTheRightTilesInFolder(folder, state, index).build(context);
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _buildProgramBlocConsumer() {
    return Container();
  }
}

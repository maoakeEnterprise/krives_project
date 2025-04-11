part of 'program_before_work_out_bloc.dart';

@immutable
abstract class ProgramBeforeWorkOutEvent {}

class ButtonLikePressed extends ProgramBeforeWorkOutEvent {
  final KrivesUser user;
  final KrivesUser userOwnerProgram;
  final Program program;
  ButtonLikePressed({required this.user, required this.program, required this.userOwnerProgram});
}

class ButtonRegisterPressed extends ProgramBeforeWorkOutEvent {
  final KrivesUser user;
  final KrivesUser userOwnerProgram;
  final Program program;
  ButtonRegisterPressed({required this.user, required this.program, required this.userOwnerProgram});

}

class LoadData extends ProgramBeforeWorkOutEvent {
  final Program program;

  LoadData({required this.program});
}
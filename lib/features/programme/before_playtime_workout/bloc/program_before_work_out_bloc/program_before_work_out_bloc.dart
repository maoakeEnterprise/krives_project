import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import 'package:krives_project/core/data/datasrouces/data_class/program.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';
import 'package:krives_project/features/programme/before_playtime_workout/services/before_playtime_server_service.dart';
import 'package:meta/meta.dart';

part 'program_before_work_out_event.dart';
part 'program_before_work_out_state.dart';

class ProgramBeforeWorkOutBloc extends Bloc<ProgramBeforeWorkOutEvent, ProgramBeforeWorkOutState> {
  ProgramBeforeWorkOutBloc() : super(ProgramBeforeWorkOutLoading()) {

    on<ButtonLikePressed>(_buttonLikePressed);
    on<ButtonRegisterPressed>(_buttonRegisterPressed);
    on<LoadData>(_loadData);


  }

  Future<void> _buttonLikePressed(ButtonLikePressed event, Emitter<ProgramBeforeWorkOutState> emit) async {
    try{
      ///We update the program if the user like or unlike on the program who is a data in the phone
      ///and next i send a request to the server to like or unlike the program
      ///and to finish i pass the data in the state to the page like this the page will update stuff on this.

      await BeforePlaytimeServerServices.likeProgram(event.user, event.program);
      emit(ProgramBeforeWorkOutLoaded(userOwnerProgram: event.userOwnerProgram, program: event.program, currentUser: event.user));

    }catch(error){
      emit(ProgramBeforeWorkOutError(message: "Something is wrong when we try to like or unlike : $error"));
    }
  }


  ///Idem like the _buttonLikePressed but for Register.
  Future<void> _buttonRegisterPressed(ButtonRegisterPressed event, Emitter<ProgramBeforeWorkOutState> emit) async {
    try{
      Program programUpdateRegister = Program.updateRegister(event.program, event.user);
      BeforePlaytimeServerServices.registerProgram(event.user, event.program);
      emit(ProgramBeforeWorkOutLoaded(userOwnerProgram: event.userOwnerProgram, program: programUpdateRegister, currentUser: event.user));
    }catch(error){
      emit(ProgramBeforeWorkOutError(message: "Something is wrong when we try to register or unregister : $error"));
    }
  }

  ///its an initial function who exist just to load the data like : TheOwnerOfTheProgram : cause the User who is on the program will only get the idUser of the owner.
  ///and its here to show the series present in the program like this he can look what content is in the program if he want to start or not.
  ///I don't know if we need to setup an order just by precaution i will set up an idOrder for each series create in the same idProgram with an ID autogenerate
  Future<void> _loadData(LoadData event, Emitter<ProgramBeforeWorkOutState> emit) async {
    try{
      KrivesUser userOwnerProgram = await BeforePlaytimeServerServices.getTheUserOwnerProgram(event.program);
      KrivesUser currentUser = await AuthServerServices.getUserData();
      emit(ProgramBeforeWorkOutLoaded(userOwnerProgram: userOwnerProgram, program: event.program,currentUser: currentUser));
    }catch(error){
      emit(ProgramBeforeWorkOutError(message: "Something is wrong when we are trying to get the data : $error"));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:krives_project/features/comment/services/comment_server_services.dart';
import 'package:meta/meta.dart';

part 'user_comment_event.dart';
part 'user_comment_state.dart';

class UserCommentBloc extends Bloc<UserCommentEvent, UserCommentState> {
  UserCommentBloc() : super(UserCommentLoading()) {
    on<InitGetUser>(_getUser);
  }

  Future<void> _getUser(InitGetUser event, Emitter<UserCommentState> emit) async {
    try {
      String pseudo = await CommentServerServices.getPseudoName(event.idUser);
      emit(UserCommentLoaded(pseudo: pseudo));
    }catch(error) {
      emit(UserCommentError(errorMessage: "Error during the request : $error"));
    }
  }
}

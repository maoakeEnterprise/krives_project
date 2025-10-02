import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/features/comment/services/comment_server_services.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<NewComment>(_newComment);
  }

  Future<void> _newComment(NewComment event, Emitter<CommentState> emit) async {
    List<Commentary> commentaries = [];
    try{
      await CommentServerServices.add(event.comment, event.idProgram);
      commentaries = await CommentServerServices.getComments(event.idProgram);
      emit(CommentLoaded(commentaries: commentaries));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
    //emit()
  }
}

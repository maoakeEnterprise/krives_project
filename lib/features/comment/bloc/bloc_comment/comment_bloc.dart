import 'package:bloc/bloc.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentaries.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';
import 'package:krives_project/features/comment/services/comment_server_services.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentLoading()) {
    on<NewComment>(_newComment);
    on<CommentLoad>(_loadComments);
  }

  Future<void> _newComment(NewComment event, Emitter<CommentState> emit) async {
    List<Commentary> listCommentaries = [];
    Commentaries commentaries;
    try{
      await CommentServerServices.add(event.comment, event.idProgram);
      listCommentaries = await CommentServerServices.getComments(event.idProgram);
      commentaries = Commentaries.initCommentaries(listCommentaries);
      commentaries = Commentaries.sortCommentaries(commentaries);
      emit(CommentLoaded(commentaries: commentaries));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
  }

  Future<void> _loadComments(CommentLoad event, Emitter<CommentState> emit) async {
    List<Commentary> listCommentaries = [];
    Commentaries commentaries;
    try{
      listCommentaries = await CommentServerServices.getComments(event.idProgram);
      commentaries = Commentaries.initCommentaries(listCommentaries);
      commentaries = Commentaries.sortCommentaries(commentaries);
      emit(CommentLoaded(commentaries: commentaries));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
  }
}

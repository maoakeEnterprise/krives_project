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
    on<IsLikedComment>(_isLikedComment);
    on<NewCommentUnderComment>(_newCommentUnderComment);
  }

  Future<void> _newComment(NewComment event, Emitter<CommentState> emit) async {
    List<Commentary> listCommentaries = [];
    Commentaries commentaries;
    Map<String, String> pseudo = {};
    try{
      await CommentServerServices.add(event.comment, event.idProgram);
      listCommentaries = await CommentServerServices.getComments(event.idProgram);
      commentaries = Commentaries.initCommentaries(listCommentaries);
      commentaries = Commentaries.sortCommentariesByRelevance(commentaries);
      for(int i = 0; i < commentaries.getLength(); i++){
        pseudo[commentaries.commentaries[i].idUser] =
        await CommentServerServices.getPseudoName(commentaries.commentaries[i].idUser);
      }
      emit(CommentLoaded(commentaries: commentaries, pseudo: pseudo));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
  }

  Future<void> _loadComments(CommentLoad event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    List<Commentary> listCommentaries = [];
    Map<String, String> pseudo = {};
    Commentaries commentaries;
    try{
      listCommentaries = await CommentServerServices.getComments(event.idProgram);
      commentaries = Commentaries.initCommentaries(listCommentaries);
      commentaries = Commentaries.sortCommentariesByRelevance(commentaries);
      commentaries = Commentaries.sortCommentariesByUnderComm(commentaries);
      commentaries = Commentaries.subSortCommentariesByRelevance(commentaries);
      for(int i = 0; i < commentaries.getLength(); i++){
        pseudo[commentaries.commentaries[i].idUser] =
        await CommentServerServices.getPseudoName(commentaries.commentaries[i].idUser);
      }
      emit(CommentLoaded(commentaries: commentaries, pseudo: pseudo));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
  }

  Future<void> _isLikedComment(IsLikedComment event, Emitter<CommentState> emit) async {
    try{
      await CommentServerServices.addRemoveLike(event.commentary);
      emit(CommentLoaded(commentaries: event.commentaries, pseudo: event.pseudo));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
  }

  Future<void> _newCommentUnderComment(NewCommentUnderComment event, Emitter<CommentState> emit) async {
    List<Commentary> listCommentaries = [];
    Commentaries commentaries;
    Map<String, String> pseudo = {};
    try{
      await CommentServerServices.addUnderCommentary(event.comment, event.idProgram,event.idUnderCommentary);
      listCommentaries = await CommentServerServices.getComments(event.idProgram);
      commentaries = Commentaries.initCommentaries(listCommentaries);
      commentaries = Commentaries.sortCommentariesByRelevance(commentaries);
      commentaries = Commentaries.sortCommentariesByUnderComm(commentaries);
      for(int i = 0; i < commentaries.getLength(); i++){
        pseudo[commentaries.commentaries[i].idUser] =
        await CommentServerServices.getPseudoName(commentaries.commentaries[i].idUser);
      }
      emit(CommentLoaded(commentaries: commentaries, pseudo: pseudo));
    }catch(error){
      emit(CommentError(errorMessages: "Something is wrong when we try to add a commentary : $error"));
    }
  }
}

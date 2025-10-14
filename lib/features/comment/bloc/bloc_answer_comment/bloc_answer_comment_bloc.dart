import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_answer_comment_event.dart';
part 'bloc_answer_comment_state.dart';

class AnswerCommentBloc extends Bloc<AnswerCommentEvent, AnswerCommentState> {
  AnswerCommentBloc() : super(AnswerToTheProgram()) {
    on<AnswerUnderComment>(_answerComment);
    on<AnswerProgram>(_answerProgram);
  }

  void _answerComment(AnswerUnderComment event, Emitter<AnswerCommentState> emitter){
    emitter(AnswerToTheComment(idCommentary: event.idCommentary));
  }

  void _answerProgram(AnswerProgram event, Emitter<AnswerCommentState> emitter) {
    emitter(AnswerToTheProgram());
  }

}

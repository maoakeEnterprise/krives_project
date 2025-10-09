import 'package:krives_project/core/crypting/weighting/relevance_score_comment.dart';
import 'package:krives_project/core/data/datasrouces/data_class/commentary.dart';

class Commentaries {

  final List<Commentary> commentaries;

  Commentaries({
    required this.commentaries,
  });

  static Commentaries initCommentaries(List<Commentary> commentaries){
    Commentaries stock;
    stock = Commentaries(commentaries: commentaries);
    return stock;
  }
  static Commentaries sortCommentaries(Commentaries commentaries){
    commentaries.commentaries.length > 1 ?
      commentaries.commentaries.sort((a, b) =>
        RelevanceScoreComment.
        getRelevanceScore(b.idUserLiked.length, commentaries.getLengthSubCommentaries(b.id), b.dateCreation).
        compareTo(RelevanceScoreComment.
        getRelevanceScore(a.idUserLiked.length, commentaries.getLengthSubCommentaries(a.id), a.dateCreation)))
        :
        null;
    return commentaries;
  }
  int getLengthSubCommentaries(String idCompare){
    int length = 0;
    for(int i = 0; i < getLength(); i++){
      if(getCommentary(i).idAnswerCommentary == idCompare){
        length++;
      }
    }
    return length;
  }

  int getLength(){
    return commentaries.length;
  }
  Commentary getCommentary(int index){
    return commentaries[index];
  }
}
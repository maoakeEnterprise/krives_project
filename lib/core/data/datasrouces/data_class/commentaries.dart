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
  static Commentaries sortCommentariesByRelevance(Commentaries commentaries){
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

  static Commentaries sortCommentariesByUnderComm(Commentaries commentaries){
    int j = 0;
    List<Commentary> tmpList = [];
    if (commentaries.getLength() > 1){
      for (int i = 0; i < commentaries.commentaries.length; i++) {
        if (commentaries.commentaries[i].idAnswerCommentary != "1"){
          tmpList.add(commentaries.commentaries[i]);
        }
      }
      for (int i =0; i < tmpList.length; i++) {
        j = 0;
        while (commentaries.commentaries[j].id != tmpList[i].idAnswerCommentary){
          j++;
        }
        commentaries.commentaries.remove(tmpList[i]);
        commentaries.commentaries.insert(j, tmpList[i]);
      }
    }
    return commentaries;
  }

  static void subSortCommentariesByRelevance(Commentaries commentaries){
    
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
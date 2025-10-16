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
  static List<Commentary> sortSubCommentByRelevance(List<Commentary> commentaries){
    commentaries.sort((a, b) =>
        RelevanceScoreComment.
        getRelevanceScore(b.idUserLiked.length, 0, b.dateCreation).
        compareTo(RelevanceScoreComment.
        getRelevanceScore(a.idUserLiked.length, 0, a.dateCreation)));
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

  static Commentaries subSortCommentariesByRelevance(Commentaries commentaries){
    List<Commentary> tmpList = [];
    int j;
    for (int i = 0; i < commentaries.getLength(); i++){
      j = i + 1;
      if (j < commentaries.getLength()) {
        if (commentaries.commentaries[i].id == commentaries.commentaries[j].idAnswerCommentary){
          tmpList = extractSubCommentaries(commentaries, i, j);
          tmpList = sortSubCommentByRelevance(tmpList);
          commentaries.commentaries.replaceRange(i+1, i+tmpList.length+1, tmpList);
          i += tmpList.length;
        }
      }
    }
    return commentaries;
  }

  static List<Commentary> extractSubCommentaries(Commentaries commentaries, int i, int j) {
    List<Commentary> tmpList = [];
    while (commentaries.commentaries[i].id == commentaries.commentaries[j].idAnswerCommentary && j < commentaries.getLength()){
      tmpList.add(commentaries.commentaries[j]);
      j++;
    }
    return tmpList;
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
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
      commentaries.commentaries.sort((a, b) => b.dateCreation.compareTo(a.dateCreation)) : null;
    return commentaries;
  }

  int getLength(){
    return commentaries.length;
  }
  Commentary getCommentary(int index){
    return commentaries[index];
  }
}
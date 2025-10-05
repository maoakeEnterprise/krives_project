import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krives_project/core/data/datasrouces/sourcelangage.dart';

class Commentary {
  String commentary;
  String underCommentaryId;
  String id;
  String idUser;
  final DateTime dateCreation;
  final String idProgram;
  String idAnswerCommentary;
  List<String> idUserLiked;

  Commentary({
    required this.underCommentaryId,
    required this.idUser,
    required this.dateCreation,
    required this.commentary,
    required this.id,
    required this.idProgram,
    required this.idAnswerCommentary,
    this.idUserLiked = const [],
  });

  static Commentary initCommentary({required String commentary, required String idProgram,String idResponseCommentary = "1",required String idUser,String underCommentaryId = "0"}){
    return Commentary(
      underCommentaryId: underCommentaryId,
      idUser: idUser,
      commentary: commentary,
      id: "1",
      idProgram: idProgram,
      idAnswerCommentary: idResponseCommentary,
      dateCreation: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'under_commentary_id': underCommentaryId,
      'id_user': idUser,
      'date_creation': dateCreation,
      'commentary': commentary,
      'id': id,
      'id_program': idProgram,
      'id_response_commentary': idAnswerCommentary,
      'id_user_liked': idUserLiked,
    };
  }

  static Commentary fromMap(Map<String, dynamic> map){
    return Commentary(
      underCommentaryId: map['under_commentary_id'],
      idUser: map['id_user'],
      dateCreation: (map['date_creation'] as Timestamp).toDate(),
      commentary: map['commentary'],
      id: map['id'],
      idProgram: map['id_program'],
      idAnswerCommentary: map['id_response_commentary'],
      idUserLiked: List<String>.from(map['id_user_liked'] as List),
    );
  }

  int getTimeWhenPosted(){
    DateTime now = DateTime.now();
    DateTime date = dateCreation;
    int diffDay = now.difference(date).inDays;
    int diffHour = now.difference(date).inHours;
    int diffMinute = now.difference(date).inMinutes;
    int diffSecond = now.difference(date).inSeconds;
    if(diffDay > 0){
      return diffDay > 28 ? diffDay ~/ 29 : diffDay;
    }
    else if(diffHour > 0){
      return diffHour;
    }
    else if(diffMinute > 0){
      return diffMinute;
    }
    else if(diffSecond > 0){
      return diffSecond;
    }
    return 0;
  }

  String getTheRightTime(int langageChoice){
    DateTime now = DateTime.now();
    DateTime date = dateCreation;
    int diffDay = now.difference(date).inDays;
    int diffHour = now.difference(date).inHours;
    int diffMinute = now.difference(date).inMinutes;
    int diffSecond = now.difference(date).inSeconds;
    if(diffDay > 0){
      return diffDay > 28 ? SourceLangage.baseCommentPageLangage[4][langageChoice]///month
          :
      SourceLangage.baseCommentPageLangage[3][langageChoice];///day
    }
    else if(diffHour > 0){
      return SourceLangage.baseCommentPageLangage[2][langageChoice];///hour
    }
    else if(diffMinute > 0){
      return SourceLangage.baseCommentPageLangage[1][langageChoice];///minutes
    }
    else if(diffSecond > 0){
      return SourceLangage.baseCommentPageLangage[0][langageChoice];///seconds
    }
    return SourceLangage.baseCommentPageLangage[0][langageChoice];///seconds
  }

  String getLengthLike(){
    int length;
    String number = "";

    length = idUserLiked.length;
    number = length > 0 ? "$length" : number;
    number = length > 99999 ? "99999+" : number;
    return number;
  }

}
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
      dateCreation: map['date_creation'],
      commentary: map['commentary'],
      id: map['id'],
      idProgram: map['id_program'],
      idAnswerCommentary: map['id_response_commentary'],
      idUserLiked: map['id_user_liked'],
    );
  }

}
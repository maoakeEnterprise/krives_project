class Commentary {
  String commentary;
  String order;
  String underCommentaryId;
  String id;
  String idUser;
  final String dateCreation;
  final String idProgram;
  String idResponseCommentary;
  List<String> idUserLiked;

  Commentary({
    required this.underCommentaryId,
    required this.idUser,
    required this.dateCreation,
    required this.commentary,
    required this.order,
    required this.id,
    required this.idProgram,
    required this.idResponseCommentary,
    this.idUserLiked = const [],
  });

  static Commentary initCommentary({required String commentary, required String idProgram,String idResponseCommentary = "1",required String idUser,String underCommentaryId = "0"}){
    return Commentary(
      underCommentaryId: underCommentaryId,
      idUser: idUser,
      commentary: commentary,
      order: "1",
      id: "1",
      idProgram: idProgram,
      idResponseCommentary: idResponseCommentary,
      dateCreation: DateTime.now().toString(),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'under_commentary_id': underCommentaryId,
      'id_user': idUser,
      'date_creation': dateCreation,
      'commentary': commentary,
      'order': order,
      'id': id,
      'id_program': idProgram,
      'id_response_commentary': idResponseCommentary,
      'id_user_liked': idUserLiked,
    };
  }

  static Commentary fromMap(Map<String, dynamic> map){
    return Commentary(
      underCommentaryId: map['under_commentary_id'],
      idUser: map['id_user'],
      dateCreation: map['date_creation'],
      commentary: map['commentary'],
      order: map['order'],
      id: map['id'],
      idProgram: map['id_program'],
      idResponseCommentary: map['id_response_commentary'],
      idUserLiked: map['id_user_liked'],
    );
  }

}
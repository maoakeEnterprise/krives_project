class Commentary {
  String commentary;
  String order;
  String id;
  final String idProgram;
  String idResponseCommentary;

  Commentary({
    required this.commentary,
    required this.order,
    required this.id,
    required this.idProgram,
    required this.idResponseCommentary,
  });

  static Commentary initCommentary({required String commentary, required String idProgram,String idResponseCommentary = "1"}){
    return Commentary(
      commentary: commentary,
      order: "1",
      id: "1",
      idProgram: idProgram,
      idResponseCommentary: idResponseCommentary,
    );
  }

}
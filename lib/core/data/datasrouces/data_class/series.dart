
class Series {
  String id;
  final String idUser;
  final String idProgram;
  int orderNumber;
  String idExercice;
  int numberSeries;
  String typeSeries;
  int maxKG; /// represent the actual weight if the user is in a normal series in KG
  int maxLBS;/// represent the actual weight if the user is in a normal series in LBS
  int numberRep;
  int diffKG;
  int diffLBS;
  int diffRep;

  Series({
    required this.id,
    required this.idUser,
    required this.idProgram,
    required this.idExercice,
    required this.orderNumber,
    this.numberSeries = 1,
    this.typeSeries = 'normal',
    this.maxKG = 0,
    this.maxLBS = 0,
    this.numberRep = 0,
    this.diffKG=0,
    this.diffLBS=0,
    this.diffRep=0,
  });

  static Series initSeries(String idProgram,String idUser,int orderNumber){
    return Series(
      id: "init",
      idUser: idUser,
      idProgram: idProgram,
      idExercice: "init",
      orderNumber: orderNumber,
    );
  }

  static Series fromMap(Map<String, dynamic> map){
    return Series(
      id: map['id'],
      idUser: map['idUser'],
      idProgram: map['idProgram'],
      idExercice: map['idExercice'],
      numberSeries: map['numberSeries'],
      typeSeries: map['typeSeries'],
      maxKG: map['maxKG'],
      maxLBS: map['maxLBS'],
      numberRep: map['numberRep'],
      diffKG: map['diffKG'],
      diffLBS: map['diffLBS'],
      diffRep: map['diffRep'],
      orderNumber: map['orderNumber'],
    );
  }

  static Map<String, dynamic> toMap(Series series){
    return {
      'id': series.id,
      'idUser': series.idUser,
      'idProgram': series.idProgram,
      'idExercice': series.idExercice,
      'numberSeries': series.numberSeries,
      'typeSeries': series.typeSeries,
      'maxKG': series.maxKG,
      'maxLBS': series.maxLBS,
      'numberRep': series.numberRep,
      'diffKG': series.diffKG,
      'diffLBS': series.diffLBS,
      'diffRep': series.diffRep,
      'orderNumber' : series.orderNumber,
    };
  }

  void convertKgIntoLbs(){
    maxLBS = (maxKG * 2.20462).round();
    diffLBS = (diffKG * 2.20462).round();
  }
  void convertLbsIntoKg(){
    maxKG = (maxLBS / 2.20462).round();
    diffKG = (diffLBS / 2.20462).round();
  }
}
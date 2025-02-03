import 'package:krives_project/core/data/datasrouces/data_class/exercice.dart';

class Series {
  final String idUser;
  final String idProgram;
  Exercice exercice;
  int numberSeries;
  String typeSeries;
  int maxKG;
  int maxLBS;
  int numberRep;
  int diffKG;
  int diffLBS;
  int diffRep;

  Series({
    required this.idUser,
    required this.idProgram,
    required this.exercice,
    this.numberSeries = 1,
    this.typeSeries = 'Normal',
    this.maxKG = 0,
    this.maxLBS = 0,
    this.numberRep = 0,
    this.diffKG=0,
    this.diffLBS=0,
    this.diffRep=0,
  });

  void convertKgIntoLbs(){
    maxLBS = (maxKG * 2.20462).round();
    diffLBS = (diffKG * 2.20462).round();
  }
  void convertLbsIntoKg(){
    maxKG = (maxLBS / 2.20462).round();
    diffKG = (diffLBS / 2.20462).round();
  }

  Series copyWith({
    String? idUser,
    String? idProgram,
    Exercice? exercice,
    int? numberSeries,
    String? typeSeries,
    int? maxKG,
    int? maxLBS,
    int? numberRep,
    int? diffKG,
    int? diffLBS,
    int? diffRep,
  }) {
    return Series(
      idUser: idUser ?? this.idUser,
      idProgram: idProgram ?? this.idProgram,
      exercice: exercice ?? this.exercice,
      numberSeries: numberSeries ?? this.numberSeries,
      typeSeries: typeSeries ?? this.typeSeries,
      maxKG: maxKG ?? this.maxKG,
      maxLBS: maxLBS ?? this.maxLBS,
      numberRep: numberRep ?? this.numberRep,
      diffKG: diffKG ?? this.diffKG,
      diffLBS: diffLBS ?? this.diffLBS,
      diffRep: diffRep ?? this.diffRep,
    );
  }
}
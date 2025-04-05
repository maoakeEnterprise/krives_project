
import 'package:cloud_firestore/cloud_firestore.dart';

class Program {
  String id;
  String idUser;
  String name;
  DateTime date;
  List<String> inFolder;
  List<Map<String, dynamic>> registeredIn;
  List<String> idLiked;
  List<String> idSeries;

  Program({
    required this.id,
    required this.idUser,
    required this.name,
    required this.date,
    required this.inFolder,
    required this.registeredIn,
    required this.idLiked,
    required this.idSeries,
  });

  static Program initClass(){
    return Program(
      id: '',
      idUser: '',
      name: 'Programme',
      date: DateTime.now(),
      inFolder: ['Utilisateur', 'Enregistrer'],
      registeredIn: [],
      idLiked: [],
      idSeries: [],
    );
  }

  static fromMap(Map<String, dynamic> map){
    Timestamp timestamp = map['date'] as Timestamp;

    return Program(
      id: map['id'],
      idUser: map['idUser'],
      name: map['name'],
      date: timestamp.toDate(),
      inFolder: List<String>.from(map['inFolder']),
      registeredIn: List<Map<String, dynamic>>.from(map['registeredIn']),
      idLiked: List<String>.from(map['idLiked']),
      idSeries: List<String>.from(map['idSeries']),
    );
  }

  static Map<String, dynamic> toMap(Program program){
    return {
      'id': program.id,
      'idUser': program.idUser,
      'name': program.name,
      'date': program.date,
      'inFolder': program.inFolder,
      'registeredIn': program.registeredIn,
      'idLiked': program.idLiked,
      'idSeries': program.idSeries,
    };
  }
}

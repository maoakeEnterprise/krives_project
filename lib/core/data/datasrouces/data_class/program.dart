
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';

class Program {
  String id;
  String idUser;
  String name;
  DateTime date;
  List<String> inFolder;
  Map<String, List<String>> registeredIn;
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
      registeredIn: {},
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
      registeredIn: convertToMapStringList(map['registeredIn']),
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
  
  static List<String> convertDynamicStringList(dynamic value){
    if(value is List){
      return value.map((item) => item.toString()).toList();
    }
    else if(value is String){
      return [value];
    }
    else {
      return [value.toString()];
    }
  }

  static Map<String, List<String>> convertToMapStringList(Map<String,dynamic> map){
    Map<String, List<String>> newMap = {};
    map.forEach((key, value) {
      newMap[key] = convertDynamicStringList(value);
    });
    return newMap;
  }

  static Program updateLike(Program program, KrivesUser user){
    program.idLiked.contains(user.id) ? program.idLiked.remove(user.id) : program.idLiked.add(user.id);
    return program;
  }
  static Program updateRegister(Program program, KrivesUser user){
    program.registeredIn.keys.contains(user.id) ?
    program.registeredIn.remove(user.id)
        :
    {program.registeredIn[user.id] = []};
    return program;
  }
}

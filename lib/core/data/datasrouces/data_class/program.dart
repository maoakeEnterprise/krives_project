
class Program {
  String id;
  String idUser;
  String name;
  List<String> inFolder;
  List<String> registeredIn;
  List<String> inFolderOtherUserWhoRegisteredIn;
  List<String> idLiked;
  List<String> idSeries;

  Program({
    required this.id,
    required this.idUser,
    required this.name,
    required this.inFolder,
    required this.registeredIn,
    required this.inFolderOtherUserWhoRegisteredIn,
    required this.idLiked,
    required this.idSeries,
  });

  static Program initClass(){
    return Program(
      id: '',
      idUser: '',
      name: 'Programme',
      inFolder: ['Utilisateur', 'Enregistrer'],
      registeredIn: [],
      inFolderOtherUserWhoRegisteredIn: [],
      idLiked: [],
      idSeries: [],
    );
  }

  static fromMap(Map<String, dynamic> map){
    return Program(
      id: map['id'],
      idUser: map['idUser'],
      name: map['name'],
      inFolder: List<String>.from(map['inFolder']),
      registeredIn: List<String>.from(map['registeredIn']),
      inFolderOtherUserWhoRegisteredIn: List<String>.from(map['inFolderOtherUserWhoRegisteredIn']),
      idLiked: List<String>.from(map['idLiked']),
      idSeries: List<String>.from(map['idSeries']),
    );
  }

  static Map<String, dynamic> toMap(Program program){
    return {
      'id': program.id,
      'idUser': program.idUser,
      'name': program.name,
      'inFolder': program.inFolder,
      'registeredIn': program.registeredIn,
      'inFolderOtherUserWhoRegisteredIn': program.inFolderOtherUserWhoRegisteredIn,
      'idLiked': program.idLiked,
      'idSeries': program.idSeries,
    };
  }
}

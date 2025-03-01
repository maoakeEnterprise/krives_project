class Folder{
  final List<String> folders;

  Folder({required this.folders});

  static Folder initClass(){
    return Folder(
      folders: ["Utilisateur","Enregistrer"],
    );
  }

  static fromMap(Map<String, dynamic> map){
    return Folder(
      folders: List<String>.from(map['folders']),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'folders': folders,
    };
  }
}
class Folder{
  List<String> folders;

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

  static Map<String, dynamic> toMap(Folder folder){
    return {
      'folders': folder.folders,
    };
  }

  void addFolder(String name) => folders.add(name);
}
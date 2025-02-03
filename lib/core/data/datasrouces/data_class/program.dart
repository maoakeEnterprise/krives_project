import 'package:krives_project/core/data/datasrouces/data_class/series.dart';

class Program {

  String idUserOwner;
  List<String> likes;
  List<String> registers;
  String name;
  List<Series> series;
  List<String> nameFolder;
  Map<String,List<String>> nameFolderOtherUser;

  Program({
    required this.idUserOwner,
    List<String>? likes, // Utilisez un paramètre nullable
    List<String>? registers, // Utilisez un paramètre nullable
    this.name = "",
    List<Series>? series, // Utilisez un paramètre nullable
    List<String>? nameFolder,
    Map<String,List<String>>? nameFolderOtherUser,
  })  : likes = likes ?? [], // Attribuez la valeur par défaut
        registers = registers ?? [], // Attribuez une liste vide par défaut
        series = series ?? [], // Attribuez une liste vide par défaut
        nameFolder = nameFolder ?? ["User"], // Attribuez une liste qui est initialiser avec User
        nameFolderOtherUser = nameFolderOtherUser ?? {};

  void addOrRemoveLike(String userId){
  likes.contains(userId) ? likes.remove(userId) : likes.add(userId);
  }

  void addOrRemoveRegister(String userId){
    registers.contains(userId) ? registers.remove(userId) : registers.add(userId);
  }

  void addOrRemoveNameFolderOtherUser(String userId){
    nameFolderOtherUser.containsKey(userId) ? nameFolderOtherUser.remove(userId) : nameFolderOtherUser[userId] = [];
  }

   bool isUserIsInTheFolderOtherUser(String userId){
    return nameFolderOtherUser.containsKey(userId);
  }

  bool isInTheFolderOtherUser(String userId, String folderName){
    return nameFolderOtherUser.containsKey(userId) && nameFolderOtherUser[userId]!.contains(folderName);
  }

  void addInFolderOtherUser(String userId, String folderName){
    nameFolderOtherUser[userId]!.add(folderName);
  }

  void addInFolder(String folderName){
    nameFolder.add(folderName);
  }

  void removeInFolder(String folderName){
    nameFolder.remove(folderName);
  }
  void addSeries(Series series) => this.series.add(series);
  void removeSeries(Series series) => this.series.remove(series);

  bool isInTheLikes(String userId) => likes.contains(userId);
  bool isInTheRegisters(String userId) => registers.contains(userId);

  Program copyWith({
    String? idUserOwner,
    List<String>? likes,
    List<String>? registers,
    String? name,
    List<Series>? series,
    List<String>? nameFolder,
    Map<String,List<String>>? nameFolderOtherUser,
  }) {
    return Program(
      idUserOwner: idUserOwner ?? this.idUserOwner,
      likes: likes ?? List.from(this.likes),
      registers: registers ?? List.from(this.registers),
      name: name ?? this.name,
      series: series ?? List.from(this.series),
      nameFolder: nameFolder ?? List.from(this.nameFolder),
      nameFolderOtherUser: nameFolderOtherUser ?? this.nameFolderOtherUser.map(
            (key, value) => MapEntry(key, List<String>.from(value)), // Copie profonde pour la Map
      ),
    );}
}

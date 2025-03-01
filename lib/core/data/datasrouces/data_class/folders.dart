import 'package:krives_project/core/data/datasrouces/data_class/fichier.dart';

class Folders {
  List<Fichier> folders;
  Folders(this.folders);

  void addExercice(Fichier folder) => folders.add(folder);
  bool containsFolder(String folderName) => folders.any((element) => element.name == folderName);
}
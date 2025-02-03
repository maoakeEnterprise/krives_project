import 'package:krives_project/core/data/datasrouces/data_class/folder.dart';

class Folders {
  List<Folder> folders;
  Folders(this.folders);

  void addExercice(Folder folder) => folders.add(folder);
  bool containsFolder(String folderName) => folders.any((element) => element.name == folderName);
}
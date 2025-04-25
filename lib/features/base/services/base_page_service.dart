import 'package:krives_project/features/appbar/page/appbar_custom.dart';

class BasePageService{

  static AppBarCustom getTheRightAppBarCustom(String title,int index){
    if(index == 2){
      return AppBarCustom(title: title,isEditFolderProgram: true,);
    }
    else if(index == 4){
      return AppBarCustom(title: title,isEditExercise: true,);
    }
    return AppBarCustom(title: title);
  }

}
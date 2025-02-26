import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/data/datasrouces/muscle_data.dart';

class Exercise {
  String id;
  String idUser;
  String name = "";
  Muscle mainMuscle = Muscle([], "");
  List<Muscle> secondariesMuscles = [];
  String video ="";

  Exercise(this.name, this.mainMuscle, this.secondariesMuscles, this.video,this.id,this.idUser);

    static Exercise fromMap(Map<String, dynamic> map){
    Exercise exercice;

    Muscle mainMuscle = muscleData[map['main_muscle']];

    List<Muscle> secondaryMuscle = [];

    for(int i = 0; i < map['secondary_muscle'].length; i++){
      secondaryMuscle.add(muscleData[map['secondary_muscle'][i]]);
    }
    exercice = Exercise(
        map['name'],
        mainMuscle,
        secondaryMuscle,
        map['video'],
        map['id'],
        map['id_user']
    );
    return exercice;
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'main_muscle': getMuscleIndex(mainMuscle),
      'secondary_muscle': secondariesMuscles.map((e) => getMuscleIndex(e)).toList(),
      'video': video,
      'id': id,
      'id_user': idUser
    };
  }

  bool isInTheList(Muscle muscle) {return secondariesMuscles.contains(muscle);}

  void addOrRemoveMuscle(Muscle muscle){
    isInTheList(muscle) ? secondariesMuscles.remove(muscle) : secondariesMuscles.add(muscle);
  }

  static int getMuscleIndex(Muscle muscle){
    int index = 0;
    for(int i = 0; i < muscleData.length; i++){
      if(muscleData[i].nameMuscle == muscle.nameMuscle){
        index = i;
      }
    }
    return index;
  }

  static Exercise initExercise(){
      return Exercise("",muscleData[0],[],"","","");
  }

}
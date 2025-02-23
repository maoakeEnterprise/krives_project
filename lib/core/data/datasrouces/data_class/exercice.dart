import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';
import 'package:krives_project/core/data/datasrouces/muscle_data.dart';

class Exercice {
  String id;
  String idUser;
  String name = "";
  Muscle mainMuscle = Muscle([], "");
  List<Muscle> secondariesMuscles = [];
  String video ="";

  Exercice(this.name, this.mainMuscle, this.secondariesMuscles, this.video,this.id,this.idUser);

  Exercice copyWith({String? name, Muscle? mainMuscle, List<Muscle>? secondariesMuscles, String? video,String? id,String? idUser}) {
    return Exercice(
        name ?? this.name,
        mainMuscle ?? this.mainMuscle,
        secondariesMuscles ?? List.from(this.secondariesMuscles),
        video ?? this.video,
        id ?? this.id,
        idUser ?? this.idUser
    );
  }

    static Exercice fromMap(Map<String, dynamic> map){
    Exercice exercice;

    Muscle mainMuscle = muscleData[map['main_muscle']];

    List<Muscle> secondaryMuscle = [];

    for(int i = 0; i < map['secondary_muscle'].length; i++){
      secondaryMuscle.add(muscleData[map['secondary_muscle'][i]]);
    }
    exercice = Exercice(
        map['name'],
        mainMuscle,
        secondaryMuscle,
        map['video'],
        map['id'],
        map['id_user']
    );
    return exercice;
  }





  bool isInTheList(Muscle muscle) {return secondariesMuscles.contains(muscle);}

  void addOrRemoveMuscle(Muscle muscle){
    isInTheList(muscle) ? secondariesMuscles.remove(muscle) : secondariesMuscles.add(muscle);
  }

}
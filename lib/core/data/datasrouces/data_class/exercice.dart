import 'package:krives_project/core/data/datasrouces/data_class/muscle.dart';

class Exercice {
  String name = "";
  Muscle mainMuscle = Muscle([], "");
  List<Muscle> secondariesMuscles = [];
  String video ="";

  Exercice(this.name, this.mainMuscle, this.secondariesMuscles, this.video);

  Exercice copyWith({String? name, Muscle? mainMuscle, List<Muscle>? secondariesMuscles, String? video}) {
    return Exercice(
        name ?? this.name,
        mainMuscle ?? this.mainMuscle,
        secondariesMuscles ?? List.from(this.secondariesMuscles),
        video ?? this.video
    );
  }



  bool isInTheList(Muscle muscle) {return secondariesMuscles.contains(muscle);}

  void addOrRemoveMuscle(Muscle muscle){
    isInTheList(muscle) ? secondariesMuscles.remove(muscle) : secondariesMuscles.add(muscle);
  }

}
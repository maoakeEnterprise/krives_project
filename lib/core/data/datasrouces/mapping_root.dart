import 'package:krives_project/features/exercice/exercice_main/page/exercice_page.dart';
import 'package:krives_project/features/graphics/page/graphics_page.dart';
import 'package:krives_project/features/home/pages/home_page.dart';
import 'package:krives_project/features/hub_communautaire/page/hub_communautaire_page.dart';
import 'package:krives_project/features/profil/page/profil_settings_page.dart';
import 'package:krives_project/features/programme/program_user/page/programs_user.dart';


class MappingRoot {
  final List<Map<String, dynamic>> pages = [
    {"title":"Home","titre":"Accueil","body":HomePage()},
    {"title":"Your Programs","titre":"Tes Programmes","body":ProgramsUser()},
    {"title":"Profile","titre":"Profil","body":ProfilSettingsPage()},
    {"title":"Exercise","titre":"Exercice","body":ExercicePage()},
    {"title":"Commnunity","titre":"Hub Commnunautaire","body":HubCommunautairePage()},
    {"title":"Back Tracking","titre":"Suivi Graphique","body":GraphicsPage()},
  ];

  static Map<String,String> namePageRoot = {
    "home":"/home",
    "sign_up":"/sign_page",
    "exercise":"/exercise",
    "program":"/program",
    "series":"/series",
    "workout_playtime":"/workout_playtime",
    "before_workout_playtime":"/before_workout_playtime",
    "connexion":"/connexion",
    "create_profile":"/create_profile",
    "forgot_password":"/forgot_password",
    "new_password":"/new_password",
    "file_program":"/file_program",
  };
}
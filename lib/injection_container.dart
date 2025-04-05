
import 'package:get_it/get_it.dart';
import 'package:krives_project/features/authentification/services/auth_server_services.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerSingleton<AuthServerServices>(AuthServerServices());
}
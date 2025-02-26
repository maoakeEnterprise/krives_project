
import 'package:get_it/get_it.dart';
import 'package:krives_project/core/services/auth_services.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerSingleton<AuthServices>(AuthServices());
}
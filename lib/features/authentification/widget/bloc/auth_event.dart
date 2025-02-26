part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthStarted extends AuthEvent {}
class AuthSignedOut extends AuthEvent {}
class AuthInitSignOut extends AuthEvent {}
class AuthDeleted extends AuthEvent {}
class AuthResetEmail extends AuthEvent {
  final String email;
  final BuildContext context;
  AuthResetEmail({required this.email,required this.context});
}

class AuthSignedIn extends AuthEvent {
  final String email;
  final String password;
  AuthSignedIn({required this.email,required this.password});
}

class AuthSignedUp extends AuthEvent {
  final KrivesUser krivesUser;
  final BuildContext context;
  AuthSignedUp({required this.krivesUser,required this.context});
}

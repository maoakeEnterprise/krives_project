part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String errorMessages;
  AuthError({required this.errorMessages});
}
final class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess({required this.user});
}
final class AuthNotConnected extends AuthState {}



part of 'data_user_bloc.dart';

@immutable
sealed class DataUserState {}

final class DataUserInitial extends DataUserState {}

final class DataUserLoading extends DataUserState {}
final class DataUserLoaded extends DataUserState {
  final KrivesUser user;
  DataUserLoaded({required this.user});
}
final class DataUserError extends DataUserState {
  final String message;
  DataUserError({required this.message});
}

part of 'user_comment_bloc.dart';

@immutable
sealed class UserCommentEvent {}

final class InitGetUser extends UserCommentEvent {
  final String idUser;
  InitGetUser({required this.idUser});
}

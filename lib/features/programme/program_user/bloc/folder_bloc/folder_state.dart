part of 'folder_bloc.dart';

@immutable
sealed class FolderState {

}

final class FolderLoading extends FolderState {}
final class FolderLoaded extends FolderState {
  final Folder folder;
  FolderLoaded({required this.folder});
}
final class FolderError extends FolderState {
  final String message;
  FolderError({required this.message});
}

part of 'folder_bloc.dart';

@immutable
sealed class FolderEvent {}

final class FolderInitial extends FolderEvent {}
final class FolderAdd extends FolderEvent {
  final String name;
  final Folder folder;
  FolderAdd({required this.name,required this.folder});
}
final class FolderDelete extends FolderEvent {
  final String name;
  final Folder folder;
  FolderDelete({required this.name,required this.folder});
}

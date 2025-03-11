part of 'folder_bloc.dart';

@immutable
sealed class FolderEvent {}

final class FolderInitial extends FolderEvent {}
final class FolderAdd extends FolderEvent {
  final String name;
  final Folder folder;
  FolderAdd({required this.name,required this.folder});
}

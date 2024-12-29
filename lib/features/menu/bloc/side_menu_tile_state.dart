part of 'side_menu_tile_bloc.dart';

@immutable
sealed class SideMenuTileState {}

final class SideMenuTileInitial extends SideMenuTileState {}

final class SideMenuTileSelected extends SideMenuTileState {
  final int index;
  SideMenuTileSelected({required this.index});
}

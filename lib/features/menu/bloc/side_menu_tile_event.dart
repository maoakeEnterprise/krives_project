part of 'side_menu_tile_bloc.dart';

@immutable
sealed class SideMenuTileEvent {}

class SideMenuTilePressed extends SideMenuTileEvent {
  final int index;
  SideMenuTilePressed(this.index);
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'side_menu_tile_event.dart';
part 'side_menu_tile_state.dart';

class SideMenuTileBloc extends Bloc<SideMenuTileEvent, SideMenuTileState> {
  SideMenuTileBloc() : super(SideMenuTileSelected(index: 0)) {
    on<SideMenuTileEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SideMenuTilePressed>((event, emit) => emit(SideMenuTileSelected(index: event.index)));
  }
}

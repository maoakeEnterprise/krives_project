import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_widget_event.dart';
part 'menu_widget_state.dart';

class MenuWidgetBloc extends Bloc<MenuWidgetEvent, MenuWidgetState> {
  MenuWidgetBloc() : super(MenuWidgetInitial()) {
    on<MenuWidgetEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MenuWidgetEventUserPressed>((event, emit){
      emit(MenuWidgetUser());
    });
    on<MenuWidgetEventHubPressed>((event, emit){
      emit(MenuWidgetHub());
    });
  }
}

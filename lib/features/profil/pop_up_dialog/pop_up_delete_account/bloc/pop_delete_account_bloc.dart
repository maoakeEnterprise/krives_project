import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pop_delete_account_event.dart';
part 'pop_delete_account_state.dart';

class PopDeleteAccountBloc extends Bloc<PopDeleteAccountEvent, PopDeleteAccountState> {
  PopDeleteAccountBloc() : super(PopNotUped()) {

    on<PopIsUp>((event, emit) {emit(PopUped());});
    on<PopClosed>((event, emit) {emit(PopNotUped());});
  }
}

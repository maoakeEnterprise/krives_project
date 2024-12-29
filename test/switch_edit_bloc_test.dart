import 'package:krives_project/features/home/bloc/switch_edit_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main(){
  group(SwitchEditBloc, (){

    late SwitchEditBloc bloc;

    setUp((){
      bloc = SwitchEditBloc();
    });

    test('Initial State is SwitchEditStateOff', (){
      expect(bloc.state, equals(SwitchEditStateOff()));
    });
  });
  blocTest('emit SwitchEditStateOn when SwitchEventPressed is Pressed',
    build: () => SwitchEditBloc(),
    act: (bloc) => bloc.add(SwitchEditEventPressed()),
    expect: () => [SwitchEditStateOn()],
  );
  blocTest('emit SwitchEditStateOff when SwitchEventPressed is Pressed',
    build: () => SwitchEditBloc(),
    act: (bloc) => bloc.add(SwitchEditEventMenuPressed()),
    expect: () => [SwitchEditStateOff()],
  );
}
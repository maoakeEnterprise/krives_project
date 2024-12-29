part of 'timer_bloc.dart';

@immutable
sealed class TimerEvent {}

class TimerValidateSeriesPressed extends TimerEvent {}
class TimerFinishedSeriesPressed extends TimerEvent {}

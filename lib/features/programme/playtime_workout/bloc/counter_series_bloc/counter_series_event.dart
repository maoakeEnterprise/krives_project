part of 'counter_series_bloc.dart';

@immutable
sealed class CounterSeriesEvent {}

class CounterSerieIncremented extends CounterSeriesEvent {}
class CounterSerieReset extends CounterSeriesEvent {}

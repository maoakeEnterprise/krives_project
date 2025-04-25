part of 'series_bloc.dart';

@immutable
abstract class SeriesEvent {}

final class SeriesInit extends SeriesEvent {
  final Program program;
  SeriesInit({required this.program});
}

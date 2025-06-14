part of 'series_bloc.dart';

@immutable
abstract class SeriesEvent {}

final class SeriesInit extends SeriesEvent {
  final Program program;
  SeriesInit({required this.program});
}

final class ChangeInTheSeries extends SeriesEvent {
  final String idProgram;
  ChangeInTheSeries({required this.idProgram});
}

final class DeleteSeries extends SeriesEvent {
  final Series series;
  final Program program;
  DeleteSeries({required this.series,required this.program});
}

final class LoadTheSeries extends SeriesEvent {
  final Series series;
  final Program program;
  LoadTheSeries({required this.series, required this.program});
}

final class ChangeNameProgram extends SeriesEvent {
  final TextEditingController name;
  final Program program;
  ChangeNameProgram({
    required this.name,
    required this.program,
  });
}



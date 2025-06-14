part of 'create_series_bloc.dart';

@immutable
sealed class CreateSeriesEvent {}

final class CreateNewSeries extends CreateSeriesEvent{
  final Program program;
  final int orderNumber;
  CreateNewSeries({required this.program,required this.orderNumber});
}
final class LoadSeries extends CreateSeriesEvent{
  final Series series;
  LoadSeries({required this.series});
}
final class UpdateSeries extends CreateSeriesEvent{
  final Series series;
  UpdateSeries({required this.series});
}
final class ValidateSeries extends CreateSeriesEvent{
  final Series series;
  ValidateSeries({required this.series});
}

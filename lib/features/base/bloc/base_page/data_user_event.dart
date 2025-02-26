part of 'data_user_bloc.dart';

@immutable
sealed class DataUserEvent {}

class LoadDataUser extends DataUserEvent {}

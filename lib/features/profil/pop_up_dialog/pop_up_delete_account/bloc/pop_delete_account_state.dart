part of 'pop_delete_account_bloc.dart';

@immutable
sealed class PopDeleteAccountState {}

final class PopDeleteAccountInitial extends PopDeleteAccountState {}
final class PopUped extends PopDeleteAccountState {}
final class PopNotUped extends PopDeleteAccountState {}

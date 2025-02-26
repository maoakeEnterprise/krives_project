part of 'pop_delete_account_bloc.dart';

@immutable
sealed class PopDeleteAccountEvent {}

class PopIsUp extends PopDeleteAccountEvent {}
class PopClosed extends PopDeleteAccountEvent {}

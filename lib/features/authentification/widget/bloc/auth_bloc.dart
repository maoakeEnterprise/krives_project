import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:krives_project/core/data/datasrouces/data_class/krives_user.dart';
import '../../../../core/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription<User?> _authStateSubscription;
  AuthBloc() : super(AuthLoading()) {

    _authStateSubscription =
        AuthServices.authInstance.authStateChanges().listen((user) {
          //check if the user is connected or not
          add(user != null ? AuthStarted():AuthInitSignOut());
    });

    on<AuthStarted>(_onAuthStarted);
    on<AuthSignedOut>(_onAuthSignedOut);
    on<AuthInitSignOut>(_onInitSignOut);
    on<AuthSignedIn>(_onAuthSignedIn);
    on<AuthResetEmail>(_onAuthResetEmail);
    on<AuthDeleted>(_onAuthDeleted);
    on<AuthSignedUp>(_onAuthSignedUp);

  }
  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthStarted(AuthStarted event, Emitter<AuthState> emit) async {

    final user = AuthServices.currentUser; // check if the user is connected or not
    emit(user != null ? AuthSuccess(user: user) : AuthNotConnected());
  }

  void _onInitSignOut(AuthInitSignOut event, Emitter<AuthState> emit) {
    emit(AuthNotConnected());
  }

  Future<void> _onAuthSignedOut(AuthSignedOut event, Emitter<AuthState> emit) async {
    await AuthServices.signOut();
    emit(AuthNotConnected());
  }

  Future<void> _onAuthSignedIn(AuthSignedIn event, Emitter<AuthState> emit) async {
    String email = event.email;
    String password = event.password;

    if(AuthServices.verifEmptyTextField(email) && AuthServices.verifEmptyTextField(password)){
      try{
        emit(AuthLoading());
        await AuthServices.signInWithEmailAndPassword(email, password);
        emit(AuthSuccess(user: AuthServices.currentUser!));
      }catch(error){
        emit(AuthError(errorMessages: '$error'));

      }
    }
    else{
      emit(AuthError(errorMessages: "There is a text field empty or not in a correct format"));

    }
  }

  Future<void> _onAuthResetEmail(AuthResetEmail event, Emitter<AuthState> emit) async {
    String email = event.email;
     try{
       AuthServices.verifEmptyTextField(email) ?
       await AuthServices.sendPasswordResetEmail(email)
           :
       emit(AuthError(errorMessages: "There is a text field empty or not in a correct format"));
       event.context.mounted ? Navigator.pop(event.context) : null;

    }catch(error){
      emit(AuthError(errorMessages: '$error'));
    }
  }

  Future<void> _onAuthSignedUp(AuthSignedUp event, Emitter<AuthState> emit) async {
    KrivesUser newUser = event.krivesUser;
    emit(AuthLoading());
    try{
      await newUser.createUserWithEmailAndPassword();
      event.context.mounted ? Navigator.pop(event.context) : null;
      emit(AuthSuccess(user: AuthServices.currentUser!));
    }
    catch(error){
      emit(AuthError(errorMessages: '$error'));
    }
  }

  Future<void> _onAuthDeleted(AuthDeleted event, Emitter<AuthState> emit) async {
    try{
      emit(AuthLoading());
      await AuthServices.deleteAccount();
      emit(AuthNotConnected());
    }
    catch(error){
      log('Error during the suppression of the data : $error');
      emit(AuthError(errorMessages: '$error'));
    }
  }



}

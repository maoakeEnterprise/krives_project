import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krives_project/core/data/datasrouces/data_class/user_sport.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> deleteAccount(String userId, String password,BuildContext context) async {
    try{
      // Get the data of the user if the data not exist he will cancel the function
      DocumentSnapshot snapshot = await _fireStore.collection('users').doc(userId).get();
      if(!snapshot.exists){return;}
      //Encapsulate the data in a UserSport object and verify the password
      UserSport user = UserSport.fromMap(snapshot.data() as Map<String, dynamic>);
      if(user.password != password){
        context.mounted ? showSnackBarMethod(context, 'Wrong password') : null;
        return;
      }

      await deleteDataFromAccount(userId);// Delete the data from firebase
      await  deleteUserAuth(userId);// Delete the account from firebase


      await _auth.signOut(); //Force the SignOut
      if(context.mounted){
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      }


      //Go to the login page

    }catch(e){
      log('Error during the suppression of the data : $e');
    }
  }

  Future<void> deleteDataFromAccount(String userId) async {
    try {
      await _fireStore.collection('users').doc(userId).delete();
    } catch (error) {
      log('Error during the suppression of the data : $error');
    }
  }

  Future<void> deleteUserAuth(String userId) async {
    try {
      final user = _auth.currentUser;
      if (user?.uid != userId) {
        return;
      }
      user != null ? await user.delete() : null;
      log('Account deleted successfully');
    } on FirebaseAuthException catch (e) {
      log('Error during the suppression of the account : $e');
      String errorMessage = 'An error occured while deleting the account.'; // Default error message

      switch (e.code) {
        case 'requires-recent-login':
          errorMessage =
          'You need to reauthenticate to delete your account. Please reauthenticate and try again.';
          break;

        default:
          errorMessage = 'An unknown error occurred.';
          break;
      }
      log(errorMessage);

    } catch (e) {
      String message = 'Error during account deletion : $e';
      log(message);
    }
  }

  Future<void> signOut(BuildContext context) async {
    // TODO: implement signOut
    try{
      await _auth.signOut();
      log("User Deconnected");
      if(context.mounted){
        Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      }
    }
    on FirebaseAuthException catch(e){
      String message = 'Error during the connexion : $e';
      log(message);
      context.mounted ? showSnackBarMethod(context, message) : null;
    }
    catch(e){
      String message = 'Error during the connexion : $e';
      log(message);
      context.mounted ? showSnackBarMethod(context, message) : null;
    }
  }

  Future<void> signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('User connected ');
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    } on FirebaseAuthException catch (e) {
      log('Error connexion : $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error connexion : $e')),
        );
      }
    } catch (e) {
      log('Error connexion : : $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error connexion : $e')),
        );
      }
    }
  }

  Future<void> sendPasswordResetEmail(BuildContext context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      log('E-mail to reset password sent');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'E-mail to reset password sent')),
        );
      }
    } on FirebaseAuthException catch (e) {
      log('Error to send e-mail : $e');
      String errorMessage = 'Error is coming '; // Default error message

      switch (e.code) {
        case 'auth/missing-email':
          errorMessage = 'Enter an email';
          break;
        case 'auth/invalid-email':
          errorMessage = 'Enter an valid email';
          break;
        case 'auth/user-not-found':
          errorMessage = 'No user found with this email';
          break;
      // Add more cases as needed for other potential errors

        default:
          errorMessage = 'An error occurred.';
          break;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      log('Error to send e-mail : $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Unknow error')),
        );
      }
    }
  }

  void showSnackBarMethod(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
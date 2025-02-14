import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSport {
  String id;
  String pseudo;
  String name;
  String firstName;
  String sex;
  DateTime birthDate;
  double age;
  String email;
  double weight;
  double height;
  String password;
  List<String> allergies;

  UserSport({
    this.id="",
    required this.pseudo,
    required this.name,
    required this.firstName,
    required this.birthDate,
    this.age = 0,
    required this.sex,
    required this.email,
    this.weight = 0,
    required this.password,
    this.allergies= const [],
    this.height= 0
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'pseudo': pseudo,
      'name': name,
      'firstName': firstName,
      'birthDate': birthDate,
      'age': age,
      'sex': sex,
      'email': email,
      'weight': weight,
      'height': height,
      'password': password,
      'allergies': allergies
    };
  }

  static UserSport fromMap(Map<String, dynamic> map){
    return UserSport(
      id: map['id'],
      pseudo: map['pseudo'],
      name: map['name'],
      firstName: map['firstName'],
      birthDate: map['birthDate'].toDate(),
      age: map['age'],
      sex: map['sex'],
      email: map['email'],
      weight: map['weight'],
      height: map['height'],
      password: map['password'],
      allergies: List<String>.from(map['allergies']),
    );
  }

  Future<void> createUserWithEmailAndPassword(UserSport newUser) async {
    Map<String,String> mapError = {
      'email-already-in-use': 'Email already use',
      'invalid-email': 'Invalid email address',
      'weak-password': 'The password is weak',
    };
    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: newUser.email, password: newUser.password,);
      newUser.id = credentials.user!.uid;

      final db = FirebaseFirestore.instance;

      await db.collection('users').doc(newUser.id).set(newUser.toMap());
    } on FirebaseAuthException catch (error){

      if(error.code.contains(mapError.keys as Pattern) ){
        log(mapError[error.code]!);
      }
    } catch (error) {
      log(error.toString());
    }
  }
  void logUserProperties() {
    log('User Properties:');
    log('  ID: $id');
    log('  Name: $name');
    log('  Pseudo: $pseudo');
    log('  First Name: $firstName');
    log('  Sex: $sex');
    log('  Birth Date: ${birthDate.toString()}');
    log('  Age: $age');
    log('  Email: $email');
    log('  Weight: $weight');
    log('  Height: $height');
    log('  Password: $password');
    log('  Allergies: ${allergies.join(', ')}');

  }

  UserSport copyWith({
    String? id,
    String? name,
    String? pseudo,
    String? firstName,
    DateTime? birthDate,
    double? age,
    String? sex,
    String? email,
    double? weight,
    double? height,
    String? password,
    List<String>? allergies,
  }) {
    return UserSport(
      id: id ?? this.id,
      name: name ?? this.name,
      pseudo: pseudo ?? this.pseudo,
      firstName: firstName ?? this.firstName,
      birthDate: birthDate ?? this.birthDate,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      email: email ?? this.email,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      password: password ?? this.password,
      allergies: allergies ?? this.allergies,
    );
  }


}



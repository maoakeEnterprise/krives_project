import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class KrivesUser {
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

  KrivesUser({
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
      'birthDate': Timestamp.fromDate(birthDate),
      'age': age,
      'sex': sex,
      'email': email,
      'weight': weight,
      'height': height,
      'password': password,
      'allergies': allergies
    };
  }

  static KrivesUser fromMap(Map<String, dynamic> map){
    return KrivesUser(
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

  Future<void> createUserWithEmailAndPassword() async {
    final credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password,);
    id = credentials.user!.uid;
    final db = FirebaseFirestore.instance;
    await db.collection('users').doc(id).set(toMap());
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

  KrivesUser copyWith({
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
    return KrivesUser(
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

  static String getGender(int genderSelected) {
    return genderSelected == 1 ? "Man" : "Woman";
  }

  static KrivesUser createUser(Map<String, String> map, int genderSelected) {
    KrivesUser user;
    user = KrivesUser(
      pseudo: map["pseudo"]!,
      name: map["name"]!,
      firstName: map["firstName"]!,
      birthDate: DateTime.now(),
      sex: KrivesUser.getGender(genderSelected),
      email: map["email"]!,
      password: map["password"]!,
    );
    return user;
  }


}



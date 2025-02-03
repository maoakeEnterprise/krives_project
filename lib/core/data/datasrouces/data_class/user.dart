import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
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

  User(
      {this.id="",
      required this.name,
      required this.firstName,
      required this.birthDate,
      this.age = 0,
      required this.sex,
      required this.email,
      this.weight = 0,
      required this.password,
      this.allergies= const [],
      this.height= 0});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
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

  Future<void> createUserWithEmailAndPassword(User newUser) async {
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
        print(mapError[error.code]);
      }
    } catch (error) {
      print(error);
    }
  }

  User copyWith({
    String? id,
    String? name,
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
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
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


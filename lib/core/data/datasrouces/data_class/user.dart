class User {
  String id;
  String name;
  String firstName;
  DateTime birthDate;
  double age;
  String email;
  double weight;
  double height;
  String password;
  List<String> allergies;

  User(this.id,
      this.name,
      this.firstName,
      this.birthDate,
      this.age,
      this.email,
      this.weight,
      this.password,
      this.allergies,
      this.height);
}
class User {
  final String _id;
  String _name;
  String _firstName;
  DateTime _birthDate;
  double _age;
  String _email;
  double _weight;
  String _password;
  List<String> _allergies;

  User(this._id, this._name, this._firstName, this._birthDate, this._age, this._email, this._weight, this._password, this._allergies);

  //GETTER
  String get id => _id;
  String get name => _name;
  String get firstName => _firstName;
  DateTime get birthDate => _birthDate;
  double get age => _age;
  String get email => _email;
  double get weight => _weight;
  String get password => _password;
  List<String> get allergies => _allergies;

  //SETTER
  set name(String value) => _name = value;
  set firstName(String value) => _firstName = value;
  set birthDate(DateTime value) => _birthDate = value;
  set age(double value) => _age = value;
  set email(String value) => _email = value;
  set weight(double value) => _weight = value;
  set password(String value) => _password = value;
  set allergies(List<String> value) => _allergies = value;
}
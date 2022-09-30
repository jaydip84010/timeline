class Model {
  int id;
  String name;
  String email;
  String mobile;
  String password;
  String dob;

  Model(
      {required this.id,
      required this.name,
      required this.email,
      required this.mobile,
      required this.dob,
      required this.password});

  factory Model.fromJson(Map<String, dynamic> map) {
    return Model(
        name: map['name'],
        id: map['id'],
        email: map['email'],
        mobile: map['mobile'],
        dob: map['dob'],
        password: map['password']);
  }
}

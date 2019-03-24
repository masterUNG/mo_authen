class UserModel {
  // Field
  int id;
  String name, email, password;

  // Constructor
  UserModel(this.id, this.name, this.email, this.password);

  UserModel.fromJson(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    name = parseJSON['Name'];
    email = parseJSON['User'];
    password =parseJSON['Password'];
  }
}

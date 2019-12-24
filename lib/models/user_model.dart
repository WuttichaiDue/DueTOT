class UserModel {
  // ! Field
  String id, name, user, password, avatar;
  // !Constructor
  UserModel(this.id, this.name, this.user, this.avatar, this.password);
  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name= map['Name'];
    user= map['User'];
    password= map['Password'];
    avatar= map['Avata'];
  }
}

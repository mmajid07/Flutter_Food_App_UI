class UserDetailModel{
  final String name;
  final String email;
  final String password;
  UserDetailModel({required this.name,required this.email, required this.password});

  Map<String , dynamic> toMap(){
    return {
      "name" : name,
      "userEmail" : email,
      "userPassword" : password
    };
  }
}
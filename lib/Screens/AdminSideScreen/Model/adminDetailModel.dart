class AdminDetail{
  final String email;
  final String password;
  AdminDetail({required this.email, required this.password});

  Map<String , dynamic> toMap(){
    return {
      "adminEmail" : email,
      "adminPassword" : password
    };
  }
}
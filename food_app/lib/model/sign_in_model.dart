class SignInBody {
  String password;
  String email;

  SignInBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["email"] = email;
    data["password"] = password;

    return data;
  }
}

class SignUpBody {
  String name;
  String password;
  String email;
  String phone;

  SignUpBody(
      {required this.email,
      required this.password,
      required this.phone,
      required this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["f_name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;

    return data;
  }
}

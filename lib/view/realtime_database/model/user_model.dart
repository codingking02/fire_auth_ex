class UserModel {
  String name;
  String email;
  String phone;
  String jobTitle;
  UserModel({
    required this.email,
    required this.jobTitle,
    required this.name,
    required this.phone,
  });
  Map tomMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "jobTitle": jobTitle,
    };
  }
}

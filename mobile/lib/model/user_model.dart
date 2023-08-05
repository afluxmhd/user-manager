class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.email,
  });
  final String id;
  final String name;
  final String status;
  final String gender;
  final String email;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'gender': gender,
      'email': email,
    };
  }
}

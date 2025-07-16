// lib/features/auth/data/user_model.dart

enum Role { admin, employee }

class UserData {
  final String uid;
  final String name;
  final String email;
  final String employeeId;
  final Role role;
  final String? profilePic;
  final DateTime createdAt;

  UserData({
    required this.uid,
    required this.name,
    required this.email,
    required this.employeeId,
    required this.role,
    this.profilePic,
    required this.createdAt,
  });
}

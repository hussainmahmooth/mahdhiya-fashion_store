import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String role;
  final String accountStatus;
  final DateTime createdAt;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    this.role = 'customer',
    this.accountStatus = 'active',
    required this.createdAt,
  });

  Map<String, dynamic> toMap(String password) {
    return {
      'full_name': fullName,
      'email': email,
      'password': password, // Storing as requested by user, though not recommended
      'role': role,
      'account_status': accountStatus,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'customer',
      accountStatus: map['account_status'] ?? 'active',
      createdAt: (map['created_at'] as Timestamp).toDate(),
    );
  }
}

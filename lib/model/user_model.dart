import 'dart:convert';

class UserModel {
  String fullName;
  DateTime? dateOfBirth;
  String email;
  String? phoneNo; // Optional phoneNo field
  String? gender;
  String? photoUrl;
  String uid; // Required uid field

  UserModel({
    required this.fullName,
    required this.email,
    required this.uid,
    this.dateOfBirth,
    this.phoneNo,
    this.gender,
    this.photoUrl,
  });

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth!.toIso8601String(),
      'email': email,
      if (phoneNo != null) 'phoneNo': phoneNo,
      if (gender != null) 'gender': gender,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'uid': uid,
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      email: json['email'],
      phoneNo: json['phoneNo'],
      gender: json['gender'],
      photoUrl: json['photoUrl'],
      uid: json['uid'],
    );
  }
}
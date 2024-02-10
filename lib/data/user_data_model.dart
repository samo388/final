import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  String name;
  String email;
  String password;
  int age;
  String uid;
  String imageUrl;
  String phoneNo;

  UserDataModel({
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.uid,
    required this.imageUrl,
    required this.phoneNo,
  });

  factory UserDataModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> map) {
    return UserDataModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      age: map['age'],
      uid: map['uid'],
      imageUrl: map['userImage'],
      phoneNo: map['phoneNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'age': age,
      'uid': uid,
      'userImage': imageUrl,
      'phoneNo': phoneNo,
    };
  }
}

import 'package:flutter/rendering.dart';

class UserModel{
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  String? username;
  String? contact;


  UserModel({this.uid,this.username,this.firstname,this.lastname,this.contact,this.email,});

  //data from server
factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    username: map['username'],
    email: map['email'],
    firstname: map['firstname'],
    lastname: map['lastname'],
    contact: map['contact'],
  );
}

//sending data to server
Map<String, dynamic> toMap(){
  return{
    'uid': uid,
    'email': email,
    'username': username,
    'firstname': firstname,
    'lastname': lastname,
    'contact': contact

  };
}
}
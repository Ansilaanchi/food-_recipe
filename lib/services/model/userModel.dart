


import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String name;
  final String uid;
  final String username;
  final String bio;
  final String profilepic;

  UserModel({
    required this.email,
    required this.name,
    required this.username,
    required this.uid,
    required this.bio,
    required this.profilepic,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "name": name,
        "username": username,
        "bio": bio,
        "profilepic": profilepic,
      };

  // Create a constructor that takes a Map<String, dynamic>
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      bio: map['bio'],
      profilepic: map['profilepic'],
    );
  }

  // Create a method to convert a DocumentSnapshot to a UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }

 static UserModel getModelFromJson({required Map<String, dynamic> json}) {
  return UserModel(
    username: json['username'],
    uid: json['uid'],
    name: json['name'],
    email: json['email'],
    bio: json['bio'],
    profilepic: json['profilepic'],
  );
}

}



// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String email;
//   final String name;
//   final String uid;
//   final String username;
//   final String bio;
//   final String profilepic;

//   UserModel({
//     required this.email,
//     required this.name,
//     required this.username,
//     required this.uid,
//      required this.bio,
//      required this.profilepic,
//   });

//   Map<String, dynamic> toJson() => {
//         "email": email,
//         "uid": uid,
//         "name": name,
//         "username": username,
//         "bio":bio,
//         "profilepic": profilepic,
//       };

//   static UserModel? fromSnap(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;
//     return UserModel(
//       username: snapshot['username'],
//       uid: snapshot['uid'],
//       name: snapshot['name'],
//       email: snapshot['email'],
//       bio: snapshot['bio'],
//       profilepic : snapshot['profilepic'],
      
//     );
//   }

//   static UserModel getModelFromJson(void updateProfilePicture, {required json}) {
//  var snapshot = json.data() as Map<String, dynamic>;
//     return UserModel(
//       username: snapshot['username'],
//       uid: snapshot['uid'],
//       name: snapshot['name'],
//       email: snapshot['email'],
//       bio: snapshot['bio'],
//       profilepic : snapshot['profilepic'],
      
//     );
//   }
// }
  


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewNote{
  final String titleId;
  final String yourStory;
  final String timeStamp;

  NewNote( {
    required this.yourStory,
    required this.titleId,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap(){
    return {
      "Story" : yourStory,
      "Text" : titleId,
      "TimeStamp" :timeStamp,
    };
  }

}

class NoteService {
  // get instance of firebase & auth

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _fireStore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((docs) {
        final user = docs.data();
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiveId, message) async {
    //get current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    NewNote newMessage = NewNote(yourStory: '', titleId: '', timeStamp: ''
       );

    //construct chat room ID for the two users(sorted to  ensure uniqueness)
    List<String> ids = [currentUserId, receiveId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // add new message to database
    await _fireStore
        .collection("note_room")
        .doc(chatRoomId)
        .collection("newnote")
        .add(newMessage.toMap());
  }

//get messages
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection("note_room")
        .doc(chatRoomId)
        .collection("newnote")
        .orderBy("timestap", descending: false)
        .snapshots();
  }
}
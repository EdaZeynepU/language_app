import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String password, String userName) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'password': password,
        'name': userName,
        'completedLevels': [],
        'points':0,
      });
      print("User created: ${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // Get the user from the users collection
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      print("User signed in: ${userDoc['email']}");
    } on FirebaseAuthException catch (e){
      print(e.message);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    print("User signed out");
  }

  void deleteUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).delete();
      print("User deleted");
    } on FirebaseAuthException catch (e){
      print(e.message);
    }
  }

  Future<DocumentSnapshot<Object?>> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference userRef = userCollection.doc(user!.uid);
    DocumentSnapshot userDoc = await userRef.get();

    return userDoc;
  }


}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsetse/Models/user_model.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> signUpWithEmailPassword(
  String email,
  String password,
  String name,
) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userCredentialData = UserModel(
      uid: userCredential.user!.uid,
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredentialData.uid)
        .set(userCredentialData.toMap());
  } catch (e) {}
}

Future<void> SignInWithEmialandPassword(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();

    final user = UserModel.fromMap(doc.data()!);
  } catch (e) {}
}

Future<void> signOutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print("Error signing out: $e");
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsetse/Models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Sign up function

  Future<UserModel> signup(String name, String email, String password) async {
    final UserCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final newUser = UserModel(
      uid: UserCredential.user!.uid,
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );

    await _firebaseFirestore
        .collection('users')
        .doc(UserCredential.user!.uid)
        .set(newUser.toMap());

    return newUser;
  }

  // Login Fucntion

  Future<UserModel> Login(String email, String password) async {
    final UserCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final snapshot = await _firebaseFirestore
        .collection('users')
        .doc(UserCredential.user!.uid)
        .get();

    return UserModel.fromMap(snapshot.data()!);
  }

  // logOut Fucntion
  Future<void> logout() async {
    await _auth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tsetse/views/Home_screen.dart';
import 'package:tsetse/views/authentication/permission.dart';
import 'package:tsetse/views/splash_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PermissionScreen();
        }
        return SplashScreen();
      },
    );
  }
}

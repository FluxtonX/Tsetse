import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsetse/Providers/Permission_provider.dart';
import 'package:tsetse/Providers/auth_provider.dart';
import 'package:tsetse/Providers/bottmonav_provider.dart';
import 'package:tsetse/Providers/confirmvisibility_provider.dart';
import 'package:tsetse/Providers/passwordvissibility_provider.dart';
import 'package:tsetse/Providers/settings_provider.dart';
import 'package:tsetse/firebase_options.dart';
import 'package:tsetse/views/authentication/auth_wrapper.dart';
import 'package:tsetse/views/face_verifactionscreen.dart';
import 'package:tsetse/views/splash_screen.dart';
import 'package:tsetse/views/wakeup_activation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp((const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
        ChangeNotifierProvider(create: (_) => PermissionProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => ConfirmvisibilityProvider()),
         ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

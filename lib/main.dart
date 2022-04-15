import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/providers/user_provider.dart';
import 'package:flutter_insta/responsive/mobile_screen_layout.dart';
import 'package:flutter_insta/responsive/responsive_layout_screen.dart';
import 'package:flutter_insta/responsive/web_screen_layout.dart';
import 'package:flutter_insta/screens/login_screen.dart';
import 'package:flutter_insta/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCW1_3_rwGRWxUQcDScKHp05W5zwZkYBkU",
        // authDomain: "flutter-insta-6cfd4.firebaseapp.com",
        projectId: "flutter-insta-6cfd4",
        storageBucket: "flutter-insta-6cfd4.appspot.com",
        messagingSenderId: "1017737368560",
        appId: "1:1017737368560:web:0a5304a3ae1752a6404335",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

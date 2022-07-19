import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/utils/colors.dart';
import 'package:whatsapp_clone_flutter/features/landing_screen.dart';
import 'package:whatsapp_clone_flutter/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor
        )
      ),
            onGenerateRoute: (settings) => generateRoute(settings),

      home: LandingScreen(),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayoutScreen(),
      //   webScreenLayout: WebLayoutScreen(),
      // ),
    );
  }
}

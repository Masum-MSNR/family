import 'package:family/consts/c_colors.dart';
import 'package:family/database/firestore_handler.dart';
import 'package:family/ui/pages/home_page.dart';
import 'package:family/ui/pages/on_boarding_page.dart';
import 'package:family/utils/prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirestoreHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Family',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CColors.navyBlue),
        useMaterial3: true,
      ),
      home: Prefs.isFirstTime ? const OnBoardingPage() : const HomePage(),
      // home: const OnBoardingPage(),
    );
  }
}

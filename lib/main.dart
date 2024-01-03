import 'package:family/ui/pages/home_page.dart';
import 'package:family/ui/pages/on_boarding_page.dart';
import 'package:family/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Prefs.isFirstTime ? const OnBoardingPage() : const HomePage(),
    );
  }
}

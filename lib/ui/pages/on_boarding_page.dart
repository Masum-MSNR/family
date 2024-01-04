import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/fancy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../utils/prefs.dart';
import '../widgets/popups/add_sheet.dart';
import 'home_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/icon.png'),
                      height: 100,
                    ),
                    WidgetMask(
                      mask: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: CColors.cyan,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: CColors.red,
                            ),
                          ),
                        ],
                      ),
                      childSaveLayer: true,
                      blendMode: BlendMode.srcATop,
                      child: const Text(
                        'Family,',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'is a mobile app.'
                      ' That helps you to manage your family shopping list easily.'
                      ' You can add, edit, delete, and share your shopping list with your family.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: CColors.navyBlue.withOpacity(0.75),
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue with',
                      style: TextStyle(
                        color: CColors.navyBlue,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                FancyButton(
                  height: 50,
                  color: CColors.cyan,
                  icon: Icons.male,
                  text: 'New List',
                  onTap: () {
                    Prefs.user = 'father';
                    Prefs.isFirstTime = false;
                    Get.offAll(() => const HomePage());
                  },
                ),
                const SizedBox(height: 20),
                FancyButton(
                  height: 50,
                  color: CColors.red,
                  icon: Icons.female,
                  text: 'Existing List',
                  onTap: () {
                    final listCodeController = TextEditingController();
                    Get.bottomSheet(AddSheet(
                      buttonText: 'Continue',
                      hint: 'Enter code',
                      controller: listCodeController,
                      onTap: () {
                        Get.back();
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

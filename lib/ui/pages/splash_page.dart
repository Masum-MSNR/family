import 'package:family/consts/c_colors.dart';
import 'package:family/ui/widgets/square_text_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_mask/widget_mask.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                      Image(
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
                        'Continue as',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SquareTextIconButton(
                        size: 140,
                        color: CColors.cyan,
                        icon: Icons.male,
                        text: 'Husband',
                        onTap: () {},
                      ),
                      SquareTextIconButton(
                        size: 140,
                        color: CColors.red,
                        icon: Icons.female,
                        text: 'Wife',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

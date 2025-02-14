import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_shop/core/extensions/text_style_extensions.dart';

import '../../../core/res/media.dart';
import '../../../core/res/styles/colors.dart';
import '../../../core/res/styles/text.dart';
import '../../../core/utils/core_utils.dart';
import '../../auth/presentation/screens/login_screen.dart';
import '../../shared/widgets/rounded_button.dart';

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : first = true;

  const OnBoardingInfoSection.second({super.key}) : first = false;

  final bool first;

  @override
  Widget build(BuildContext context) {
    final adaptiveColour = CoreUtils.adaptiveColour(
      context,
      darkModeColour: Colors.white,
      lightModeColour: Colours.lightThemePrimaryTextColour,
    );
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(first ? Media.onBoardingFemale : Media.onBoardingMale),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (first)
              Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                    text: '2024\n',
                    style: TextStyles.headingBold.orange,
                    children: [
                      TextSpan(
                        text: 'Winter Sale is Live now.',
                        style: TextStyle(
                          color: adaptiveColour,
                        ),
                      )
                    ]),
              )
            else
              Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: 'Flash Sale\n',
                  style: TextStyles.headingBold.copyWith(
                    color: adaptiveColour,
                  ),
                  children: [
                    const TextSpan(
                      text: "Men's ",
                      style: TextStyle(
                        color: Colours.lightThemeSecondaryColour,
                      ),
                    ),
                    TextSpan(
                      text: 'Shirts & Watches',
                      style: TextStyle(
                        color: CoreUtils.adaptiveColour(
                          context,
                          darkModeColour: Colors.white,
                          lightModeColour: Colours.lightThemePrimaryTextColour,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            RoundedButton(
              text: 'Get Started',
              onPressed: () {
                // sl<CacheHelper>().cacheFirstTimer();
                // context.pushReplacement(LoginScreen.path);
                Get.off(() => const LoginScreen());
              },
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_shop/core/extensions/text_style_extensions.dart';
import 'package:swift_shop/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:swift_shop/features/shared/widgets/rounded_button.dart';

import '../../../../core/res/styles/text.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../shared/widgets/vertical_label_field.dart';
import '../controllers/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePasswordNotifier = ValueNotifier(true);
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    obscurePasswordNotifier.dispose();
    super.dispose();
  }

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      authController.login(email: email, password: password);
    } else {
      Get.snackbar('Error', 'Please enter both email and password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          VerticalLabelField(
            label: 'Email',
            hintText: 'Enter your email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          Gap(20),
          ValueListenableBuilder(
              valueListenable: obscurePasswordNotifier,
              builder: (_, value, __) {
                return VerticalLabelField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      obscurePasswordNotifier.value =
                          !obscurePasswordNotifier.value;
                    },
                    child: Icon(
                      value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  obscureText: value,
                );
              }),
          const Gap(20),
          SizedBox(
            width: double.maxFinite,
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // context.push(ForgotPasswordScreen.path);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.paragraphSubTextRegular1.primary,
                  ),
                )),
          ),
          const Gap(40),
          RoundedButton(
              onPressed: () {
                _login();
              },
              text: 'Sign In'),
        ],
      ),
    );
  }
}

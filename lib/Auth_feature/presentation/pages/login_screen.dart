import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noteit/Auth_feature/presentation/widgets/default_button_widget.dart';
import 'package:noteit/Auth_feature/presentation/widgets/logo_text.dart';
import 'package:noteit/Auth_feature/presentation/widgets/textformfield_widget.dart';
import 'package:noteit/core/utils/constants/images/images_path.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final Size mobileSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              noteIcon,
              scale: 3,
            ),
            const Gap(40),
            const LogoText(fontSize: 24),
            const Gap(40),

            /// user name
            AuthTextFormField(
              hintmessage: 'user name ',
              controller: _userNameController,
              textInputType: TextInputType.name,
              icon: Icons.person,
            ),
            const Gap(20),

            /// password
            AuthTextFormField(
              hintmessage: "password",
              controller: _passwordController,
              isObsecure: true,
              textInputType: TextInputType.visiblePassword,
              icon: Icons.password,
            ),
            const Gap(20),

            //login button
            DefaultButton(
              onTap: () {},
              mobileSize: mobileSize,
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

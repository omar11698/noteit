import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noteit/Auth_feature/presentation/widgets/default_button_widget.dart';
import 'package:noteit/Auth_feature/presentation/widgets/google_avatar.dart';
import 'package:noteit/Auth_feature/presentation/widgets/logo_text.dart';
import 'package:noteit/Auth_feature/presentation/widgets/textformfield_widget.dart';
import 'package:noteit/core/config/router/navigation_router.dart';
import 'package:noteit/core/utils/constants/images/images_path.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late Size mobileSize;

  ///text editing contollers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mobileSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),

              ///logo
              Image.asset(
                noteIcon,
                scale: 5,
              ),
              const Gap(20),

              const LogoText(fontSize: 24),
              const Gap(20),

              /// username
              AuthTextFormField(
                hintmessage: 'user name',
                controller: _usernameController,
                textInputType: TextInputType.name,
                icon: Icons.person,
              ),
              const Gap(20),

              /// password
              AuthTextFormField(
                hintmessage: 'password',
                controller: _passwordController,
                isObsecure: true,
                textInputType: TextInputType.visiblePassword,
                icon: Icons.password,
              ),
              const Gap(20),

              /// confirm password
              AuthTextFormField(
                hintmessage: 'confirm password',
                controller: _confirmPasswordController,
                isObsecure: true,
                textInputType: TextInputType.visiblePassword,
                icon: Icons.password_outlined,
              ),
              const Gap(20),

              /// email
              AuthTextFormField(
                hintmessage: 'email address',
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                icon: Icons.email,
              ),
              const Gap(20),

              /// phone number
              AuthTextFormField(
                hintmessage: 'phone number',
                controller: _phoneNumberController,
                textInputType: TextInputType.phone,
                icon: Icons.phone,
              ),
              const Gap(20),

              Align(
                alignment: Alignment.centerRight,
                child: alreadyHaveAccount(mobileSize, context),
              ),
              const Gap(20),

              ///register button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: DefaultButton(
                    mobileSize: mobileSize,
                    label: 'register',
                    onTap: () => _register()),
              ),

              const Gap(20),

              orRow(mobileSize),
              const Gap(20),

              googleAndFacebookAuth(mobileSize),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  _register() {
    Navigator.pushNamed(context, loginRoute);
  }

  Padding googleAndFacebookAuth(Size mobileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GoogleFacebookCard(
            cardName: "Google",
            icon: googleImage,
            onTap: () {},
          ),
          SizedBox(
            width: mobileSize.height * 0.03,
          ),
          GoogleFacebookCard(
            cardName: "Facebook",
            icon: facebookImage,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Padding orRow(Size mobileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: mobileSize.width >= 360 ? 100 : 0,
                child: const Divider(
                  color: Colors.grey,
                  thickness: 1,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "or sign in with ",
              ),
            ),
            SizedBox(
                width: mobileSize.width >= 360 ? 100 : 0,
                child: const Divider(
                  color: Colors.grey,
                  thickness: 1,
                )),
          ],
        ),
      ),
    );
  }

  SizedBox alreadyHaveAccount(Size mobileSize, BuildContext context) {
    return SizedBox(
      width: mobileSize.width * 0.6,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have account ',
              style: TextStyle(fontSize: mobileSize.width > 768 ? 16 : 12),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, loginRoute),
              child: Text(
                " Log In",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: mobileSize.width > 768 ? 16 : 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

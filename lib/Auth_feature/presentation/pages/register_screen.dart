import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noteit/Auth_feature/presentation/widgets/default_button_widget.dart';
import 'package:noteit/Auth_feature/presentation/widgets/google_avatar.dart';
import 'package:noteit/Auth_feature/presentation/widgets/google_facebook_auth.dart';
import 'package:noteit/Auth_feature/presentation/widgets/logo_text.dart';
import 'package:noteit/Auth_feature/presentation/widgets/or_widget.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mobileSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
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
              const Gap(5),

              Align(
                alignment: Alignment.centerRight,
                child: alreadyHaveAccount(mobileSize, context),
              ),
              const Gap(15),

              ///register button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: DefaultButton(
                    mobileSize: mobileSize,
                    label: 'register',
                    onTap: () => _register()),
              ),

              const Gap(20),

              OrWidget(mobileSize: mobileSize),
              const Gap(20),

              GoogleAndFaceBookAuthWidget(mobileSize: mobileSize),
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

  SizedBox alreadyHaveAccount(Size mobileSize, BuildContext context) {
    return SizedBox(
      width: mobileSize.width * 0.6,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have account ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, loginRoute),
              child: Text(
                " Log In",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

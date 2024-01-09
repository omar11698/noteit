import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:noteit/core/config/router/navigation_router.dart';
import 'package:noteit/core/utils/constants/images/images_path.dart';

import '../widgets/widgets.dart';

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(80),
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
              const Gap(5),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: mobileSize.width * 0.6,
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'doesn\'t have account? ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, registerRoute),
                              child: Text(
                                " Register now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(15),

              //login button
              DefaultButton(
                onTap: () {},
                mobileSize: mobileSize,
                label: 'Login',
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
}

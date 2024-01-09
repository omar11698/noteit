import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noteit/Auth_feature/presentation/widgets/google_avatar.dart';
import 'package:noteit/core/utils/constants/images/images_path.dart';

class GoogleAndFaceBookAuthWidget extends StatelessWidget {
  final Size mobileSize;
  const GoogleAndFaceBookAuthWidget({super.key, required this.mobileSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GoogleFacebookCard(
            cardName: "Google",
            icon: googleImage,
            onTap: () {
              log("Google");
            },
          ),
          SizedBox(
            width: mobileSize.height * 0.03,
          ),
          GoogleFacebookCard(
            cardName: "Facebook",
            icon: facebookImage,
            onTap: () {
              log("Facebook");
            },
          ),
        ],
      ),
    );
    ;
  }
}

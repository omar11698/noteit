import 'package:flutter/material.dart';
import 'package:noteit/Auth_feature/presentation/widgets/logo_text.dart';

import '../../../../core/utils/constants/images/images_path.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.themeColor,
  });

  final ThemeData themeColor;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themeColor.primaryColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(noteIcon),
          ),
          const LogoText(fontSize: 24),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 15),
            child: ListTile(
              leading: Icon(
                Icons.bookmark_border,
                color: themeColor.splashColor,
              ),
              title: Text(
                "Bookmarks",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 15),
            child: ListTile(
              leading: Icon(
                Icons.archive_outlined,
                color: themeColor.splashColor,
              ),
              title: Text(
                "Archived",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

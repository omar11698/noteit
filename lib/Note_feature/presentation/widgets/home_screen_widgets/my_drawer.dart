import 'package:flutter/material.dart';

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
      backgroundColor:themeColor.primaryColor,
      child: Column(
        children: [
          DrawerHeader(child: Image.asset(noteIcon)),
          Padding(
            padding: const EdgeInsets.only(left:18.0,top: 15),
            child: ListTile(leading: Icon(Icons.bookmark_border,color: themeColor.splashColor,),title: Text("Bookmarks",style:TextStyle(color: themeColor.splashColor,fontSize: 18,fontWeight: FontWeight.w500) ,),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:18.0,top: 15),
            child: ListTile(leading: Icon(Icons.archive_outlined,color: themeColor.splashColor,),title: Text("Archived",style:TextStyle(color: themeColor.splashColor,fontSize: 18,fontWeight: FontWeight.w500) ,),),
          ),

        ],
      ),
    );
  }
}

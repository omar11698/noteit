import 'package:flutter/material.dart';

class GoogleFacebookCard extends StatelessWidget {
  final String icon, cardName;
  final VoidCallback? onTap;
  const GoogleFacebookCard({
    super.key,
    required this.icon,
    required this.cardName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    icon,
                  ),
                )),
            const SizedBox(
              width: 15,
            ),
            Text(
              cardName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}

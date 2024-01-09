import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  final Size mobileSize;
  const OrWidget({super.key, required this.mobileSize});

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "or sign in with ",
                style: Theme.of(context).textTheme.bodySmall,
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
    ;
  }
}

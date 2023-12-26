import 'package:flutter/material.dart';
import 'package:noteit/core/utils/extensions/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/router/navigation_router.dart';
import '../../manager/providers/color_showmodal_provider.dart';

class AddNoteFloatingActionButton extends StatelessWidget {
  const AddNoteFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<ShowColorBottomModalProvider>(context, listen: false)
            .colorSelected = Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1);

        ///my extension
        context.goTo(addNoteRoute);
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

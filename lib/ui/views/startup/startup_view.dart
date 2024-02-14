import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:provider/provider.dart';

import 'starup_viewmodel.dart';

class StarupView extends StatelessWidget {
  const StarupView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final viewModel = context.watch()<StarupViewModel>();

    //Provider.of<StarupViewModel>(context, listen: true);
    return StatefulWrapper(
      onInit: viewModel.runStarupLogic,
      child: Scaffold(
        body: Padding(
          padding: appSymmetricHorizontalPadding,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                horizontalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Startup view',
                        style: ktsMedium.copyWith(color: kcRed),
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

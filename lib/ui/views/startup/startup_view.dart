import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:provider/provider.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final viewModel = Provider.of<StartupViewModel>(context, listen: false);
    return StatefulWrapper(
      onInit: viewModel.runStartupLogic,
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  horizontalSpaceSmall,
                  SizedBox(
                    width: 17,
                    height: 17,
                    child: CircularProgressIndicator(
                      color: kcPrimaryColor,
                      strokeWidth: 6,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

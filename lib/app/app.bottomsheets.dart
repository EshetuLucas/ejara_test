// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:ejara_test/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/bottom_sheets/wallets/wallets_sheet.dart';

enum BottomSheetType {
  wallets,
}

void setupBottomSheetUi() {
  final bottomsheetService = appLocator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.wallets: (context, request, completer) =>
        WalletsSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}

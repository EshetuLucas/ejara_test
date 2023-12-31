import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/widgets/app_button.dart';
import 'package:ejara_test/ui/common/widgets/not_found_widget.dart';
import 'package:ejara_test/ui/common/widgets/ra_skeleton_loader.dart';
import 'package:ejara_test/ui/common/widgets/stateful_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'wallets_sheet_model.dart';

class WalletsSheet extends StatelessWidget {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const WalletsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final viewModel = Provider.of<WalletsSheetModel>(context, listen: true);
    return StatefulWrapper(
      key: const Key('WalletsSheet'),
      onInit: () => viewModel.onInit(request.data),
      onDispose: viewModel.disposeViewModel,
      child: Container(
        decoration: const BoxDecoration(
          color: kcBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(18),
              Padding(
                padding: appSymmetricHorizontalPadding,
                child: Row(
                  children: [
                    horizontalSpaceSmall,
                    Expanded(
                      child: Text(
                        'Select the ${request.title} method',
                        style: ktsLargMedium.copyWith(
                            color: kcPrimaryColor, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    horizontalSpaceSmall,
                    InkWell(
                      key: const Key('closeBottomSheet'),
                      onTap: viewModel.onClose,
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceTiny,
              const Divider(),
              verticalSpaceSmall,
              if (!viewModel.isBusy && viewModel.hasError) ...[
                verticalSpaceMedium,
                NotFoundWidget(
                  title: 'Unable to fetch payment settings.',
                  onTap: viewModel.getPaymentSettingsByType,
                ),
                verticalSpaceMedium,
              ] else ...[
                if (!viewModel.isBusy && viewModel.paymentSettings.isEmpty)
                  Padding(
                    padding: appSymmetricHorizontalPadding,
                    child: const Center(
                      child: Text(
                        'No Payment setting found!',
                        style: ktsMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                _PaymentSettings(viewModel: viewModel),
                verticalSpaceSmall,
                const Row(
                  children: [
                    horizontalSpaceSmall,
                    Expanded(child: Divider()),
                    horizontalSpaceSmall,
                    Text('Or'),
                    horizontalSpaceSmall,
                    Expanded(child: Divider()),
                    horizontalSpaceSmall,
                  ],
                ),
                verticalSpaceMedium,
                Padding(
                  padding: appSymmetricHorizontalPadding,
                  child: AppButton(
                    key: const Key('anotherPaymentMethodButton'),
                    backgroundColor: kcSecondaryColor.withOpacity(0.2),
                    title: '+ Another ${request.title} method',
                    textColor: kcSecondaryColor,
                    onTap: viewModel.onAddAnotherMethod,
                    enablebuttonTextStyle: ktsLargBold,
                  ),
                ),
                verticalSpace(16),
                Padding(
                  padding: appSymmetricHorizontalPadding,
                  child: AppButton(
                    enabled: viewModel.hasSelectedPaymentSetting,
                    title: 'Confirm',
                    onTap: () => completer?.call(
                      (SheetResponse(
                        data: viewModel.selectedPaymentSetting,
                      )),
                    ),
                  ),
                ),
                verticalSpaceTiny
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentSettings extends StatelessWidget {
  const _PaymentSettings({
    required this.viewModel,
  });

  final WalletsSheetModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: viewModel.paymentSettings.length,
        separatorBuilder: (BuildContext context, int index) {
          return verticalSpaceSmall;
        },
        itemBuilder: (BuildContext context, int index) {
          final paymentSetting = viewModel.paymentSettings[index];

          return InkWell(
            onTap: () => viewModel.onSelectPaymentSetting(paymentSetting),
            child: Container(
              color: kcWhite,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                children: [
                  RASkeletonLoader(
                      radius: 100,
                      loading: viewModel.isBusy,
                      child: Icon(
                        viewModel.isPaymentSettingSelected(paymentSetting.id)
                            ? CupertinoIcons.circle_fill
                            : CupertinoIcons.circle,
                        color: kcPrimaryColor,
                        size: 14,
                      )),
                  horizontalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RASkeletonLoader(
                        loading: viewModel.isBusy,
                        child: Text(
                          'PaymentMethodsBaseUrl.title_en',
                          style: ktsMedium.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
                      if (viewModel.isBusy) verticalSpaceTiny,
                      RASkeletonLoader(
                        loading: viewModel.isBusy,
                        child: Text(
                          'paymentMethod.description_en',
                          style: ktsSmall.copyWith(
                            fontSize: 10,
                            color: kcMediumGrey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

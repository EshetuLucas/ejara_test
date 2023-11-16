import 'package:ejara_test/ui/common/app_text_styles.dart';
import 'package:ejara_test/ui/common/widgets/icon_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejara_test/ui/common/app_colors.dart';
import 'package:ejara_test/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appSymmetricHorizontalPadding,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_PaymentMethod(), _SelectPaymentMethods()],
          ),
        ),
      ),
    );
  }
}

class _SelectPaymentMethods extends StatelessWidget {
  const _SelectPaymentMethods();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpaceMedium,
        const Text(
          'Select a payment methods',
          style: ktsTitle,
        ),
        verticalSpaceSmall,
        ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const IconBuilder(iconData: CupertinoIcons.creditcard),
                  horizontalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cash payment',
                        style: ktsMedium.copyWith(fontSize: 14),
                      ),
                      Text(
                        'Fees:offer',
                        style: ktsSmall.copyWith(
                          fontSize: 10,
                          color: kcMediumGrey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceTiny,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(context) / 16),
          child: Text(
            'Choose a payment method',
            style: ktsLargBold.copyWith(color: kcPrimaryColor, fontSize: 26),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpaceMedium,
        Container(
          width: screenWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: kcWhite,
          ),
          child: Column(
            children: [
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: kcSecondaryColor,
                      ),
                      child: const Icon(
                        Icons.folder_outlined,
                        color: kcWhite,
                        size: 18,
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      'Ejara Flex',
                      style: ktsMedium.copyWith(
                        color: kcMediumGrey,
                      ),
                    ),
                    verticalSpace(12),
                    Text(
                      '20,000CFA',
                      style: ktsLargBold.copyWith(
                          color: kcPrimaryColor, fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
              const Divider(),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Earnings per day',
                      style: ktsSmall.copyWith(color: kcMediumGrey),
                    ),
                    const Spacer(),
                    Text(
                      '10,000CFA',
                      style: ktsMedium.copyWith(
                          color: kcPrimaryColor.withOpacity(0.9), fontSize: 13),
                    ),
                  ],
                ),
              ),
              verticalSpace(18),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:ejara_test/ui/bottom_sheets/wallets/wallets_sheet_model.dart';
import 'package:ejara_test/ui/views/home/bloc/home_bloc.dart';
import 'package:ejara_test/ui/views/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers => [
      BlocProvider(lazy: true, create: (_) => HomeBloc()),
      BlocProvider(
        lazy: true,
        create: (_) => LoginBloc(),
      ),
      BlocProvider(
        create: (_) => WalletsSheetModel(_),
      ),
      // BlocProvider(
      //   create: (context) => NewPaymentSettingViewModel(),
      // )
    ];

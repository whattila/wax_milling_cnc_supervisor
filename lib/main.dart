import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/rest_cnc_service.dart';
import 'package:wax_milling_cnc_supervisor/widget/home/home_page.dart';

import 'app.dart';
import 'data/test_cnc_service.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      final cncServiceInterface = TestCncService();
      runApp(App(cncServiceInterface: cncServiceInterface));
    },
    blocObserver: AppBlocObserver(),
  );
}

class AppBlocObserver extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wax_milling_cnc_supervisor/data/cnc_service_interface.dart';
import 'package:wax_milling_cnc_supervisor/widget/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.cncServiceInterface}) : super(key: key);

  final CncServiceInterface cncServiceInterface;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: cncServiceInterface,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage()
    );
  }
}
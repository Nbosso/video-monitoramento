import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import 'app_store.dart';

class AppPage extends StatefulWidget {
  final String title;
  const AppPage({Key? key, this.title = 'AppPage'}) : super(key: key);
  @override
  AppPageState createState() => AppPageState();
}
class AppPageState extends State<AppPage> {

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login/');

    return MaterialApp.router(
      title: 'App Video Monitoramento',
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
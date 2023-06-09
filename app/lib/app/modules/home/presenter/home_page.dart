import 'package:app/app/modules/home/presenter/widgets/detail_camera.dart';
import 'package:app/app/modules/home/presenter/widgets/list_cameras_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String token;
  const HomePage({super.key, required this.token});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    store.token = widget.token;
    super.initState();
  }

  bool onHoverContainer = false;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: store.isFullScreen ? null : AppBar(
            backgroundColor: Colors.green[700],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: store.controllerPageView,
            children: const [
              ListCamerasWidget(),
              DetailCameraWidget()
            ],
          ),
          drawer: drawer(),
        );
      }
    );
  }

  drawer() {
    return Drawer(
      width: 250,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green[700]),
            accountName: const Text('Candidato Seventh'),
            accountEmail: const Text('candidato@seventh.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green[300],
              child: const Text(
                "CS",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                store.controllerPageView.jumpToPage(0);
              }),
          ListTile(
              enabled: false,
              leading: const Icon(Icons.account_circle),
              title: const Text("Perfil"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text("Sair"),
              onTap: () {
                Modular.to.pushNamed('/login/');
              })
        ],
      ),
    );
  }
}

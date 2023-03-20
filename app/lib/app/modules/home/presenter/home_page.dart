import 'package:app/app/modules/home/presenter/widgets/detail_camera.dart';
import 'package:app/app/modules/home/presenter/widgets/list_cameras_widget.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: store.controllerPageView,
            children: const [
              ListCamerasWidget(),
              DetailCameraWidget(camera: 'Câmera Coelho')
            ],
          )),
      drawer: drawer(),
    );
  }

  drawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[700],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.green[200],
              radius: 5,
              child: const Icon(Icons.person),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
                store.controllerPageView.jumpToPage(0);
              }),
          ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Perfil"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

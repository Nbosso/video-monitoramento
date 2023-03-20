import 'package:app/app/modules/home/presenter/home_store.dart';
import 'package:app/app/modules/home/presenter/widgets/item_camera_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListCamerasWidget extends StatefulWidget {
  const ListCamerasWidget({super.key});

  @override
  State<ListCamerasWidget> createState() => _ListCamerasWidgetState();
}

class _ListCamerasWidgetState extends State<ListCamerasWidget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: const [
          ItemCameraWidget(cameraName: 'Câmera Coelho'),
          SizedBox(
            height: 16,
          ),
          AbsorbPointer(child: ItemCameraWidget(cameraName: 'Câmera Exterior')),
        ],
      ),
    );
  }
}

import 'package:app/app/modules/home/presenter/widgets/item_camera_widget.dart';
import 'package:flutter/material.dart';

class ListCamerasWidget extends StatefulWidget {
  const ListCamerasWidget({super.key});

  @override
  State<ListCamerasWidget> createState() => _ListCamerasWidgetState();
}

class _ListCamerasWidgetState extends State<ListCamerasWidget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: const [
          ItemCameraWidget(cameraName: 'Câmera 1'),
        ],
      ),
    );
  }
}

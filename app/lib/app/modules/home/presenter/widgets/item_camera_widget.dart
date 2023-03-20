import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_store.dart';

class ItemCameraWidget extends StatefulWidget {
  final String cameraName;
  const ItemCameraWidget({super.key, required this.cameraName});

  @override
  State<ItemCameraWidget> createState() => _ItemCameraWidgetState();
}

class _ItemCameraWidgetState extends State<ItemCameraWidget> {
  final HomeStore store = Modular.get();

  bool onHoverContainer = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.controllerPageView.jumpToPage(1);
      },
      onHover: (value) {
        setState(() {
          onHoverContainer = !onHoverContainer;
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 300,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 4), blurRadius: 4)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: onHoverContainer ? Colors.grey[300] : Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.camera_outdoor_rounded,
                size: 30,
              ),
              Text(
                widget.cameraName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox.shrink()
            ],
          )),
    );
  }
}

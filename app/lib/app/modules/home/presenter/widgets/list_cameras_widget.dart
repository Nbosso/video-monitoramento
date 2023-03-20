import 'package:app/app/modules/home/presenter/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListCamerasWidget extends StatefulWidget {
  const ListCamerasWidget({super.key});

  @override
  State<ListCamerasWidget> createState() => _ListCamerasWidgetState();
}

class _ListCamerasWidgetState extends State<ListCamerasWidget> {
  final HomeStore store = Modular.get();

  bool onHoverContainer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
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
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 8),
                        blurRadius: 24)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: onHoverContainer ? Colors.grey[300] : Colors.white),
              child: const Text(
                'Câmera Coelho',
                textAlign: TextAlign.center,
              )),
        )
      ],
    );
  }
}

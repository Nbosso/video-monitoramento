import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:video_player/video_player.dart';

import '../home_store.dart';

class DetailCameraWidget extends StatefulWidget {
  const DetailCameraWidget({
    super.key,
  });

  @override
  State<DetailCameraWidget> createState() => _DetailCameraWidgetState();
}

class _DetailCameraWidgetState extends State<DetailCameraWidget> {
  final HomeStore store = Modular.get();

  bool isPlaying = true;

  @override
  void initState() {
    getUrl();
    super.initState();
  }

  getUrl() async {
    final result = await store.getUrl('bunny.mp4');
    if (result != '') {
      store.controller = VideoPlayerController.network(result)
        ..initialize()
        ..play()..setLooping(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(builder: (_) {
          return store.controller != null
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(store.controller!),
                )
              : const CircularProgressIndicator();
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpeedDial(
                buttonSize: const Size(35, 35),
                icon: Icons.update,
                backgroundColor: Colors.green[700],
                onPress: () {
                  store.controller!.seekTo(const Duration(seconds: 0));
                },
                children: [
                  SpeedDialChild(),
                ]),
                SpeedDial(
                buttonSize: const Size(38, 38),
                icon: Icons.keyboard_double_arrow_left_rounded,
                backgroundColor: Colors.green[700],
                onPress: () {
                  store.controller!.seekTo(Duration(
                      seconds:
                          store.controller!.value.position.inSeconds + 10));
                },
                children: [
                  SpeedDialChild(),
                ]),
            SpeedDial(
                icon:
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                backgroundColor: Colors.green[700],
                onPress: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                  store.controller!.value.isPlaying
                      ? store.controller!.pause()
                      : store.controller!.play();
                },
                children: [
                  SpeedDialChild(),
                ]),
                SpeedDial(
                buttonSize: const Size(38, 38),
                icon: Icons.keyboard_double_arrow_right_rounded,
                backgroundColor: Colors.green[700],
                onPress: () {
                  store.controller!.seekTo(Duration(
                      seconds:
                          store.controller!.value.position.inSeconds + 10));
                },
                children: [
                  SpeedDialChild(),
                ]),
            SpeedDial(
                buttonSize: const Size(35, 35),
                icon: Icons.fullscreen_rounded,
                backgroundColor: Colors.green[700],
                onPress: () {
                  store.setIsFullScreen();
                  if (store.isFullScreen) {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: SystemUiOverlay.values);
                  } else {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: []);
                  }
                },
                children: [
                  SpeedDialChild(),
                ]),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (store.controller != null) {
      store.controller!.dispose();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    }
    store.controller = null;
    super.dispose();
  }
}

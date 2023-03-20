import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:video_player/video_player.dart';
import 'dart:io' show Platform;
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

  VideoPlayerController? _controller;

  String url = '';

  @override
  void initState() {
    getUrl();
    super.initState();
  }

  getUrl() async {
    if (Platform.isAndroid || Platform.isAndroid) {
      final result = await store.getUrl('bunny.mp4');
      if (result != '') {
        _controller = VideoPlayerController.network(result.toString());
        setState(() {
          url = result.toString();
        });
      } else {
        setState(() {
          url = 'Erro';
        });
      }
    } else {
      setState(() {
        url = 'Erro';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: url != 'Erro'
          ? _controller != null
              ? Center(
                  child: _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : const CircularProgressIndicator(),
                )
              : const Center(child: CircularProgressIndicator())
          : const Center(
              child: Text(
              'Erro ao carregar vídeo. Por favor tente novamente utilizando um dispositivo Android.',
              textAlign: TextAlign.center,
            )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpeedDial(
                buttonSize: const Size(35, 35),
                icon: Icons.update,
                backgroundColor: Colors.green[700],
                onPress: () {
                  setState(() {
                    url = '';
                  });
                  getUrl();
                },
                children: [
                  SpeedDialChild(),
                ]),
            SpeedDial(
                animatedIcon: AnimatedIcons.play_pause,
                backgroundColor: Colors.green[700],
                onPress: () {
                  if (url != 'Erro' || url == '') {
                    setState(() {
                      _controller!.value.isPlaying
                          ? _controller!.pause()
                          : _controller!.play();
                    });
                  }
                },
                children: [
                  SpeedDialChild(),
                ]),
            SpeedDial(
                buttonSize: const Size(35, 35),
                icon: Icons.fullscreen_rounded,
                backgroundColor: Colors.green[700],
                onPress: () {
                  if (url != 'Erro' || url == '') {}
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
    super.dispose();
    if (_controller != null) {
      _controller!.dispose();
    }
  }
}

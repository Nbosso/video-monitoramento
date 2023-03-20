import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:video_player/video_player.dart';

import '../home_store.dart';

class DetailCameraWidget extends StatefulWidget {
  final String camera;
  const DetailCameraWidget({super.key, required this.camera});

  @override
  State<DetailCameraWidget> createState() => _DetailCameraWidgetState();
}

class _DetailCameraWidgetState extends State<DetailCameraWidget> {
  final HomeStore store = Modular.get();

  late VideoPlayerController _controller;

  String url = '';

  @override
  void initState() {
    super.initState();
    start();
  }

  start() async {
    final result = await store.getUrl('bunny.mp4');
    if (result != '') {
      _controller = VideoPlayerController.network(result.toString())
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
        
      setState(() {
        url = result.toString();
      });
    } else {
      setState(() {
        url = 'Erro';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: url != 'Erro' ? Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ) : const Center(child: Text('Erro ao carregar vídeo, por favor tente novamente.')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

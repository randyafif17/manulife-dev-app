// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class VlcPlayer extends StatefulWidget {
  String? nameVideo;

  VlcPlayer({
    Key? key,
    required this.nameVideo,
  }) : super(key: key);

  @override
  VlcPlayerState createState() => VlcPlayerState();
}

class VlcPlayerState extends State<VlcPlayer> {
  Player player = Player(
    id: Random().nextInt(100),
    videoDimensions: const VideoDimensions(640, 360),
    registerTexture: Platform.isWindows,
  );
  PositionState position = PositionState();
  CurrentState current = CurrentState();
  PlaybackState playbackState = PlaybackState();
  GeneralState generalState = GeneralState();
  @override
  void initState() {
    if (mounted) {
      player.currentStream.listen((current) {
        setState(() => current = current);
      });
      player.positionStream.listen((position) {
        setState(() => position = position);
      });
      player.playbackStream.listen((playback) {
        if (playback.isCompleted) {
          player.play();
        }
      });
      player.generalStream.listen((general) {
        setState(() => general = general);
      });
    }
    player.open(
      Playlist(
        medias: [Media.asset("assets/video/${widget.nameVideo}")],
      ),
      autoStart: true, // default
    );
    player.play();
    
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Video(
        fit: BoxFit.cover,
        player: player,
        width: double.infinity,
        height: double.infinity,
        volumeThumbColor: Colors.blue,
        volumeActiveColor: Colors.blue,
        showControls: false,
      ),
    );
  }
}

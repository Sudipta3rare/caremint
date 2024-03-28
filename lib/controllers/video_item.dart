import 'package:caremint/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatelessWidget {
  final String url;
  late final VideoPlayerController _videoController;
  late final Future<void> _initializeVideoPlayerFuture;

  VideoItem({super.key, required this.url}) {
    _videoController = VideoPlayerController.network(url);
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(padding: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppStyle().gradientColor1), // Add a green border
                  boxShadow: [
                    BoxShadow(
                      color: AppStyle().gradientColor2.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Shadow offset
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                iconSize: 50,
                onPressed: () {
                  _videoController.play();
                },
              ),
            ],
          ));
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppStyle().gradientColor2,
            ),
          );
        }
      },
    );
  }
}

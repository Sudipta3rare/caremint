import 'package:caremint/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final String url;

  VideoItem({Key? key, required this.url}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late final VideoPlayerController _videoController;
  late final Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _videoController.initialize();
    _videoController.addListener(() {
      if (_videoController.value.isPlaying) {
        setState(() {
          _isPlaying = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                        _isPlaying = false;
                      } else {
                        _videoController.play();
                      }
                    });
                  },
                  child: Container(
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
                ),
                if (!_isPlaying)
                  IconButton(
                    icon: Icon(Icons.play_arrow,color: AppStyle().gradientColor2),
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        _videoController.play();
                      });
                    },
                  ),
                if (_isPlaying)
                  IconButton(
                    icon: Icon(Icons.stop,color: Colors.transparent),
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        _videoController.pause();
                        _isPlaying = false;
                      });
                    },
                  ),
              ],
            ),
          );
        } else {
          return Center(
            child: Padding(padding: EdgeInsets.all(10),
              child: Container(
                height: 180,
                width: 100,
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
              ),
            )
          );
        }
      },
    );
  }
}

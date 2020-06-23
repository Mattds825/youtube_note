import 'package:flutter/material.dart';
import 'package:youtube_notes/widgets/video_widget.dart';


class VideoSideWidget extends StatelessWidget {
  const VideoSideWidget({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height / 3,
        child: AspectRatio(
          aspectRatio: 2/1,
          child: VideoWidget(''),
        ),
      ),
    );
  }
}

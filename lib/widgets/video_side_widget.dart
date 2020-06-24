import 'package:flutter/material.dart';
import 'package:youtube_notes/screens/main_screen.dart';
import 'package:youtube_notes/widgets/video_widget.dart';


class VideoSideWidget extends StatelessWidget {
  VideoSideWidget({
    Key key,
    @required this.height,
    @required this.mainScreen,
  }) : super(key: key);

  MainScreen mainScreen;

  final double height;

  VideoWidget videoWidget;

  @override
  Widget build(BuildContext context) {
    videoWidget = VideoWidget('',mainScreen);
    return Center(
      child: Container(
        height: height / 2.5,
        child: AspectRatio(
          aspectRatio: 2/1,
          child: videoWidget,
        ),
      ),
    );
  }
}

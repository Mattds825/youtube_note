import 'package:flutter/material.dart';
import 'package:responsive_util/responsive_util.dart';
import 'package:youtube_notes/test.dart';
import 'package:youtube_notes/widgets/draggable_item.dart';
import 'package:youtube_notes/widgets/note_side_widget.dart';
import 'package:youtube_notes/widgets/video_side_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);
  VideoSideWidget videoSideWidget;
  bool darkMode = false;

  _MainScreenState state = _MainScreenState();

  @override
  _MainScreenState createState() => state;
}

class _MainScreenState extends State<MainScreen> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    widget.videoSideWidget = VideoSideWidget(
      height: height,
      mainScreen: widget,
    );
    return Scaffold(
      backgroundColor: (widget.darkMode)?Colors.grey[850]:Colors.white,
      body: Center(
        child: Container(
          width: width,
          height: height,
          child: Row(
            children: [
              ResponsiveUtil(
                child: NoteSideWidget(widget),
              ),
              Expanded(
                child:

                    //VideoSideWidget(height: height),

                    Stack(
                  children: [
                    DragItem(widget.videoSideWidget),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

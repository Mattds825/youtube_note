import 'package:flutter/material.dart';
import 'package:responsive_util/responsive_util.dart';
import 'package:youtube_notes/test.dart';
import 'package:youtube_notes/widgets/draggable_item.dart';
import 'package:youtube_notes/widgets/note_side_widget.dart';
import 'package:youtube_notes/widgets/video_side_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          child: Row(
            children: [
              ResponsiveUtil(
                child: NoteSideWidget(),
              ),
              Expanded(
                child: 
                
                //VideoSideWidget(height: height),
                
                Stack(
                  children: [
                    DragItem(
                      VideoSideWidget(height: height),
                    ),
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

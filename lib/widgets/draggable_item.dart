import 'package:flutter/material.dart';
import 'package:youtube_notes/test.dart';

class DragItem extends StatefulWidget { 

  Widget child;

  DragItem(this.child);

  @override State<StatefulWidget> createState() { 
   return _DragItemState(); 
  } 
}
class _DragItemState extends State<DragItem> {
  double xPosition = 0;
  double yPosition = 0;
  Color color;
  @override
  void initState() {
    color = Colors.blue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: widget.child
      ),
    );
  }
}
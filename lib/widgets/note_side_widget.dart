import 'package:flutter/material.dart';
import 'package:youtube_notes/screens/main_screen.dart';
import 'package:youtube_notes/widgets/side_bar.dart';

class NoteSideWidget extends StatefulWidget {
  
  MainScreen mainScreen;

  NoteSideWidget(this.mainScreen);
  
  @override
  _NoteSideWidgetState createState() => _NoteSideWidgetState();
  
}

class _NoteSideWidgetState extends State<NoteSideWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      color: Color(0xfffffdd0),
      child: Row(
        children: [
          SideBar(controller, widget.mainScreen),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 50,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                hintText: 'type something\ntop button for new note\nbottom button to donwload note\ngreen button for new video\nblack button for dragging\n\n\n\nthis is a beta 🤖 if anything is glitchy try tapping the black button or the screen a few time 😁',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

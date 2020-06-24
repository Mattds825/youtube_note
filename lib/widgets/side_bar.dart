import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

import 'package:youtube_notes/screens/main_screen.dart';

class SideBar extends StatelessWidget {

  TextEditingController controller;

  MainScreen mainScreen;

  SideBar(this.controller, this.mainScreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[850],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Icon(FlutterIcons.addfile_ant, color: Colors.white),
              onTap: () {
                controller.clear();
              },
            ),
            GestureDetector(
              child: Icon(FlutterIcons.download_ant, color: Colors.white),
              onTap: () {
                _downloadFile();
                // html.window.open(file.path, 'test');
              },
            ),
          ],
        ),
      ),
    );
  }

  _downloadFile() {
    final text = '${controller.text}\n\n\n\n\nvideo link: ${mainScreen.videoSideWidget.videoWidget.ytLink}';

// prepare
    final bytes = utf8.encode(text);
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'youtube_note.txt';
    html.document.body.children.add(anchor);

// download
    anchor.click();

// cleanup
    html.document.body.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}

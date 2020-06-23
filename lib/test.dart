import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

Widget html = Html(
      data: """
        <div>
          <h1>Demo Page</h1>
          <p>This is a fantastic product that you should buy!</p>
          <h3>Features</h3>
          <ul>
            <li>It actually works</li>
            <li>It exists</li>
            <li>It doesn't cost much!</li>
          </ul>
          <!--You can pretty much put any html in here!-->
        </div>
      """,
      //Optional parameters:
      // backgroundColor: Colors.white70,
      onLinkTap: (url) {
        // open url in a webview
      },
      // style: {
      //   "div": Style(
      //     block: Block(
      //       margin: EdgeInsets.all(16),
      //       border: Border.all(width: 6),
      //       backgroundColor: Colors.grey,
      //     ),
      //     textStyle: TextStyle(
      //       color: Colors.red,
      //     ),
      //   ),
      // },
      onImageTap: (src) {
        // Display the image in large form.
      },
    );

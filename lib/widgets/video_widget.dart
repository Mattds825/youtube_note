import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class VideoWidget extends StatefulWidget {
  String url;

  VideoWidget(this.url);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  String ytLink = 'http://www.youtube.com/embed/IyFZznAk69U/';
  static ValueKey key = ValueKey('key');
  bool _isHtml = false;
  bool _isMarkdown = false;
  bool _useWidgets = false;
  bool _editing = false;
  bool _isSelectable = false;

  bool open = false;

  EasyWebView webView;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    webView = EasyWebView(
      src: ytLink,
      onLoaded: () {
        //print('$key3: Loaded: $src3');
      },
      isHtml: _isHtml,
      isMarkdown: _isMarkdown,
      convertToWidgets: _useWidgets,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(ytLink);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 500,
                      child: webView,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showDialog(context);
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            //print(webView.);
                          },
                          child: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.black,
                            ),
                            //child: Icon(FlutterIcons.move_fea),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showDialog(BuildContext c) {
    showDialog(
      context: c,
      builder: (_) {
        return AlertDialog(
          title: Text('Enter the video id e.g. IyFZznAk69U'),
          content: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              hintText: 'id',
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          actions: [
            InkWell(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                // webView.src = controller.text;
                setState(() {
                  ytLink = 'http://www.youtube.com/embed/${controller.text}';
                  webView = EasyWebView(
                    src: ytLink,
                    onLoaded: () {
                      //print('$key3: Loaded: $src3');
                    },
                    isHtml: _isHtml,
                    isMarkdown: _isMarkdown,
                    convertToWidgets: _useWidgets,
                    key: key,
                  );
                  print('controller.text');
                  print(controller.text);
                });
                Navigator.pop(context);
              },
            ),
            Text('Cancel'),
          ],
        );
      },
    );
  }
}

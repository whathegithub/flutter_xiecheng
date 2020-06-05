import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebviewPage extends StatefulWidget {
  final String url;

  WebviewPage({Key key, @required this.url});

  @override
  State<StatefulWidget> createState() => _my_state(url);
}

class _my_state extends State<WebviewPage> {
  String _url;
  _my_state(this._url);

  @override
  Widget build(BuildContext context) {
    print("----------$_url");
    return Scaffold(
      body: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'navigation_controls.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final title;

  WebViewContainer({this.url,this.title});

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  var _url;
  final _key = UniqueKey( );

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
        ),
          body: Column(
            children: [
              Expanded(
                  child: WebView(
                      key: _key,
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: _url,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                  ) )
            ],
          ) ),
    );
  }
}

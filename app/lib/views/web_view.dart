import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  WebViewContainer();

  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  
  String title = "Đang tải...";
  bool loading = true;
  WebViewController _controller;

  void updateTitle(WebViewController controller) async {
    String newTitle = await controller.getTitle();
    setState(() {
      this.title = newTitle;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final WebViewArgs args = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: <Widget>[
              Menu(_controller),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: args.url,
                      onWebViewCreated: (WebViewController webViewController) {
                        _controller = webViewController;
                      },
                      onPageFinished: (value) {
                        updateTitle(_controller);
                      },
                    ),
                    loading 
                      ? CircularProgressIndicator() 
                      : Container(),
                  ]
                ))
            ],
          )),
    );
  }
}

class WebViewArgs {
  final String title;
  final String url;

  WebViewArgs(this.url, this.title);
}

class Menu extends StatelessWidget {
  final WebViewController controller;

  Menu(this.controller);

  @override
  Widget build(BuildContext context) {
        return PopupMenuButton<String>(
          onSelected: (String value) async {
            switch (value) {
              case "goback":
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
                break;
              case "reload":
                controller.reload();
                break;
              case "openInBrowser":
                String url = await controller.currentUrl();
                url.replaceFirst("http", "googlechrome");
                launch(url);
                break;
            }
          },
          itemBuilder: (context) => <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                  value: 'goback',
                  child: Text('Quay lại'),
                ),
                const PopupMenuItem<String>(
                  value: 'reload',
                  child: Text('Tải lại'),
                ),
                const PopupMenuItem<String>(
                  value: 'openInBrowser',
                  child: Text('Mở trong Chrome'),
                ),
              ],
        );
  }
}
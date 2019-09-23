import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

List<String> option = <String>['Quay Lại'];

class NavigationControls extends StatefulWidget {
  const NavigationControls(this._webViewControllerFuture);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  _NavigationControlsState createState() => _NavigationControlsState();
}

class _NavigationControlsState extends State<NavigationControls> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: widget._webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return PopupMenuButton(
          itemBuilder: (_) {
            return option.map((String option) {
              return PopupMenuItem(
                value: option,
                child: GestureDetector(
                  child: Text(option),
                  onTap: !webViewReady
                      ? null
                      : () async {
                          if (await controller.canGoBack()) {
                            controller.goBack();
                          } else {
                            Scaffold.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("No back history item")),
                            );
                            return;
                          }
                        },
                ),
              );
            }).toList();
          },
          onSelected: (String value) {},
        );
      },
    );
  }
}

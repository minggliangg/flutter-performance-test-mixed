import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mixed_flutter/ThirdPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://flutter.dev',
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdPage(),
                      ),
                    );
                  },
                  child: Text('To Third Page'),
                )
              ],
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //
      //       //   Stack(
      //       //     children: [
      //       //       WebView(
      //       //         initialUrl: 'https://flutter.dev',
      //       //       ),
      //       //       Center(
      //       //         child: Row(
      //       //           mainAxisAlignment: MainAxisAlignment.center,
      //       //           children: [
      //       //             TextButton(
      //       //               onPressed: () {
      //       //                 Navigator.pop(context);
      //       //               },
      //       //               child: Text('Back'),
      //       //             ),
      //       //             TextButton(
      //       //               onPressed: () {
      //       //                 Navigator.push(
      //       //                   context,
      //       //                   MaterialPageRoute(
      //       //                     builder: (context) => ThirdPage(),
      //       //                   ),
      //       //                 );
      //       //               },
      //       //               child: Text('To Third Page'),
      //       //             )
      //       //           ],
      //       //         ),
      //       //       )
      //       //     ],
      //       //   ),
      //     ],
      //   ),
      // ),
    );
  }
}

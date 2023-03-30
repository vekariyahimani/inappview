import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:inappview/screen/crome/provider/crome_provider.dart';
import 'package:provider/provider.dart';

class CromeScreen extends StatefulWidget {
  const CromeScreen({Key? key}) : super(key: key);

  @override
  State<CromeScreen> createState() => _CromeScreenState();
}

class _CromeScreenState extends State<CromeScreen> {
  TextEditingController txtserch = TextEditingController();
  CromeProvider? cromeProvidertrue;
  CromeProvider? cromeProviderfalse;

  @override
  Widget build(BuildContext context) {
    cromeProviderfalse = Provider.of<CromeProvider>(context, listen: false);
    cromeProvidertrue = Provider.of<CromeProvider>(context, listen: true);

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    cromeProvidertrue!.inappwebcontroller!.goBack();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    cromeProvidertrue!.inappwebcontroller!.goForward();
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    cromeProvidertrue!.inappwebcontroller!.reload();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Container(
                  height: 50,
                  width: 210,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent,width: 2),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 2,
                        color: Colors.black12

                      )
                    ]
                  ),
                  child: TextField(
                    controller: txtserch,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        prefixIcon: IconButton(
                            onPressed: () {
                              var newlink = txtserch.text;

                              cromeProvidertrue!.inappwebcontroller!.loadUrl(
                                  urlRequest: URLRequest(
                                      url: Uri.parse(
                                          "https://www.google.com/search?q=$newlink")));
                            },
                            icon: Icon(
                              Icons.g_mobiledata,
                              size: 30,
                              color: Colors.red,
                            ))),
                  ),
                ),
              )
            ],
          ),
          LinearProgressIndicator(
            value: cromeProvidertrue!.progressWeb,
          ),
          Expanded(
              child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://www.google.com"),
            ),
            onWebViewCreated: (controller) {
              cromeProvidertrue!.inappwebcontroller = controller;
            },
            onLoadError: (controller, url, code, message) {
              cromeProvidertrue!.inappwebcontroller = controller;
            },
            onLoadStart: (controller, url) {
              cromeProvidertrue!.inappwebcontroller = controller;
            },
            onLoadStop: (controller, url) {
              cromeProvidertrue!.inappwebcontroller = controller;
            },
            onProgressChanged: (controller, progress) {
              cromeProvidertrue!.changeIndex(progress / 100);
            },
          ))
        ],
      ),
    ));
  }
}

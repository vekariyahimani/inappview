import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CromeProvider extends ChangeNotifier
{
  InAppWebViewController? inappwebcontroller;
  double progressWeb=0;

  void changeIndex(double ps)
  {

    progressWeb=ps;
    notifyListeners();
  }


}
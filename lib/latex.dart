import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Latex {
  static const MethodChannel _channel =
      const MethodChannel('latex');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Widget> getLaTeXWidget(String laTeX) async{
    if(Platform.isIOS){
      print("is ios!");
      var w = UiKitView(viewType: "iOSLatexWidget", creationParams: laTeX, creationParamsCodec: StandardMessageCodec(),);
      print("widget created!");
      return w;
    }else{
      var w = AndroidView(viewType: "androidLatexWidget", creationParams: laTeX, creationParamsCodec: StandardMessageCodec());
      return w;
    }
  }

  static Widget getLaTeXWidgetSync(String laTeX){
    if(Platform.isIOS){
      print("is ios!");
      var w = UiKitView(viewType: "iOSLatexWidget", creationParams: laTeX, creationParamsCodec: StandardMessageCodec(),);
      print("widget created!");
      return w;
    }else{
      var w = AndroidView(viewType: "androidLatexWidget", creationParams: laTeX, creationParamsCodec: StandardMessageCodec());
      return w;
    }
  }



}
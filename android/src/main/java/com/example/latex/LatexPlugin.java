package com.example.latex;

import android.content.Context;
import android.view.View;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.common.StringCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/** LatexPlugin */
public class LatexPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "latex");
    channel.setMethodCallHandler(new LatexPlugin());
    registrar.platformViewRegistry().registerViewFactory("androidLatexWidget", new AndroidWidgetFactory(new StandardMessageCodec()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getImageForLaTeX")) {

    } else {
      result.notImplemented();
    }
  }
}


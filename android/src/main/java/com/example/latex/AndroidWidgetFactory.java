package com.example.latex;

import android.content.Context;
import android.view.View;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class AndroidWidgetFactory extends PlatformViewFactory {

  public AndroidWidgetFactory(MessageCodec<Object> createArgsCodec) {
    super(createArgsCodec);
  }

  @Override
  public PlatformView create(Context context, int i, Object o) {
    return new AndroidWidget(context, o);
  }
}


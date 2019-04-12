package com.example.latex;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentSender;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.UserHandle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.Display;
import android.view.View;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import io.flutter.plugin.platform.PlatformView;
import ru.noties.jlatexmath.JLatexMathDrawable;
import ru.noties.jlatexmath.JLatexMathView;

public class AndroidWidget implements PlatformView {
  String latex;
  Context c;
  public AndroidWidget(Context context, Object o) {
    this.c = context;
    this.latex = (String) o;

  }

  @Override
  public View getView() {
    final JLatexMathDrawable drawable = JLatexMathDrawable.builder(latex)
            .textSize(50)
            .background(Color.TRANSPARENT)
            .padding(8)
            .align(JLatexMathDrawable.ALIGN_CENTER)
            .build();
    JLatexMathView jLatexMathView = new JLatexMathView(c);
    jLatexMathView.background(new ColorDrawable(Color.TRANSPARENT));
    jLatexMathView.setLatexDrawable(drawable);
    jLatexMathView.setBackgroundColor(Color.TRANSPARENT);
    return jLatexMathView;
  }

  @Override
  public void dispose() {

  }
}

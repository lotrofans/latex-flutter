# latex

Simply perfom following steps

## Import it

```dart
import 'package:latex/latex.dart';
```

## Load the Widget async

```dart
  Widget latexWidget;

  void loadWidget() async{
    if(latexWidget == null){
      latexWidget = await Latex.getLaTeXWidget("x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}");
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loadWidget();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: latexWidget == null? CupertinoActivityIndicator() : latexWidget

        ),
      ),
    );
  }
```

## important hint

This plugin uses the following libraries. 
Special thanks to the developers:

iOS: https://github.com/kostub/iosMath
Android: https://github.com/noties/jlatexmath-android
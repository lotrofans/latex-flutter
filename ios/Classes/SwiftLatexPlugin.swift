import Flutter
import UIKit
import iosMath

public class SwiftLatexPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "latex", binaryMessenger: registrar.messenger())
    let instance = SwiftLatexPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    let viewFactory = LaTeXViewFactory();
    registrar.register(viewFactory, withId: "iOSLatexWidget")
    print("registered!");
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  
  }
}

public class LaTeXView: NSObject, FlutterPlatformView{
    let latex: String;
    let frame: CGRect;
    init (_ frame: CGRect, viewId: Int64, args: Any?){
      self.frame = frame;
      self.latex = args! as! String;
      //self.latex = args as! String;
      //self.latex = "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}";
    }

  public func view() -> UIView{
    let label: MTMathUILabel = MTMathUILabel()
    label.latex = latex
    let l = UILabel();
    l.text = latex;
    return label;
  }

}

public class LaTeXViewFactory: NSObject, FlutterPlatformViewFactory{
  public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView{
    return LaTeXView(frame, viewId: viewId, args: args);
  }

  public func createArgsCodec () -> FlutterMessageCodec & NSObjectProtocol{
    return FlutterStringCodec();
  }
}

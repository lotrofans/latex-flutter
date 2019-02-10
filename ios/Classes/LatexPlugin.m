#import "LatexPlugin.h"
#import <latex/latex-Swift.h>

@implementation LatexPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLatexPlugin registerWithRegistrar:registrar];
}
@end

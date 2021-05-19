#import "EdgeToEdgePlugin.h"
#if __has_include(<edge_to_edge/edge_to_edge-Swift.h>)
#import <edge_to_edge/edge_to_edge-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "edge_to_edge-Swift.h"
#endif

@implementation EdgeToEdgePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEdgeToEdgePlugin registerWithRegistrar:registrar];
}
@end

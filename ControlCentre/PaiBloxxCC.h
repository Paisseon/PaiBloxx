#import <UIKit/UIKit.h>
#import "ControlCenterUIKit/CCUIToggleModule.h"
#import <objc/runtime.h>

@interface PaiBloxxCC : CCUIToggleModule
@end

@interface SBAirplaneModeController : NSObject
+ (id) sharedInstance;
- (void) setInAirplaneMode: (bool) arg0;
@end

@interface NSTask : NSObject
- (id) init;
- (void) launch;
- (void) setArguments: (NSArray *) arg0;
- (void) setLaunchPath: (NSString *) arg0;
- (void) setStandardInput: (NSPipe *) arg0;
- (void) setStandardOutput: (NSPipe *) arg0;
- (void) waitUntilExit;
@end
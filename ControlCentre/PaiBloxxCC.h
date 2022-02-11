#import <UIKit/UIKit.h>
#import <ControlCenterUIKit/CCUIToggleModule.h>
#import <objc/runtime.h>

@interface PaiBloxxCC : CCUIToggleModule
@end

@interface SBAirplaneModeController : NSObject
+ (id) sharedInstance;
- (void) setInAirplaneMode: (bool) arg0;
@end
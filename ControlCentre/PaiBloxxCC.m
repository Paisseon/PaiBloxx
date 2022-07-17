#import "PaiBloxxCC.h"

void runCmd(NSString *arg0) {
    NSTask *task  = [NSTask new];
    NSArray *args = @[@"-c", arg0];
    
    [task setLaunchPath: @"/bin/sh"];
    [task setArguments: args];
    [task launch];
    [task waitUntilExit];
}

// Run a shell command and return the output as an NSString, modified from Randy420's code

NSString *logCmd(NSString *arg0) {
    NSTask *task       = [NSTask new];
    NSPipe *outputPipe = [NSPipe pipe];
    NSArray *args      = @[@"-c", arg0];
    
    [task setLaunchPath: @"/bin/sh"];
    [task setArguments: args];
    [task setStandardInput: [NSPipe pipe]];
    [task setStandardOutput: outputPipe];
    [task launch];
    [task waitUntilExit];
    
    NSData *outputData = [[outputPipe fileHandleForReading] readDataToEndOfFile];
    return [[NSString alloc] initWithData: outputData encoding: NSUTF8StringEncoding];
}

@implementation UIImage (PaiBloxx)
+ (UIImage *) initWithImage: (UIImage *) arg0 withSize: (CGSize) arg1 {
	UIGraphicsImageRenderer* renderer = [[UIGraphicsImageRenderer alloc] initWithSize: arg1];
	
	UIImage *logo = [renderer imageWithActions: ^(UIGraphicsImageRendererContext *_Nonnull context) {
		[arg0 drawInRect: CGRectMake(0, 0, arg1.height, arg1.width)];
	}];
	
	renderer = NULL;
	return logo;
}
@end

@implementation PaiBloxxCC
- (UIImage *) iconGlyph {
	UIImage *logoBySudo = [UIImage imageNamed: @"ModuleIcon" inBundle: [NSBundle bundleForClass: [self class]] compatibleWithTraitCollection: nil];
	return [UIImage initWithImage: logoBySudo withSize: CGSizeMake(36, 36)];
}

- (UIColor *) selectedColor {
	return [UIColor blueColor];
}

- (bool) isSelected {
	return [logCmd(@"echo $(plutil -v -Proxies -ProxyAutoConfigEnable /var/mobile/Media/com.apple.SystemConfiguration.plist) | tail -c 2") boolValue];
}

- (void) setSelected: (bool) arg0 {
	runCmd([NSString stringWithFormat: @"echo \"plutil -Proxies -ProxyAutoConfigEnable -int %i '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo", arg0]);
    runCmd(@"killall -HUP mDNSResponderHelper");
    runCmd(@"killall -HUP CFNetworkAgent");
    
    [[objc_getClass("SBAirplaneModeController") sharedInstance] setInAirplaneMode: true];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[objc_getClass("SBAirplaneModeController") sharedInstance] setInAirplaneMode: false];
    });
	
	[super refreshState];
}
@end
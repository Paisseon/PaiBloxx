#import "PaiBloxxCC.h"

@implementation UIImage (PaiBloxx)
+ (UIImage *) initWithImage: (UIImage *) arg0 withSize: (CGSize) arg1 {
	UIGraphicsImageRenderer* renderer = [[UIGraphicsImageRenderer alloc] initWithSize: arg1];
	
	UIImage *logo                     = [renderer imageWithActions: ^(UIGraphicsImageRendererContext *_Nonnull context) {
		[arg0 drawInRect: CGRectMake(0, 0, arg1.height, arg1.width)];
	}];
	
	renderer                          = NULL;
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
	return [[NSFileManager defaultManager] fileExistsAtPath: @"/var/mobile/Media/com.apple.SystemConfiguration.plist"];
}

- (void) setSelected: (bool) arg0 {
	if (arg0) {
		if ([[NSFileManager defaultManager] moveItemAtPath: @"/var/mobile/Media/com.apple.SystemConfiguration.bak" toPath: @"/var/mobile/Media/com.apple.SystemConfiguration.plist" error:NULL]) {
			[[objc_getClass("SBAirplaneModeController") sharedInstance] setInAirplaneMode: true];
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				[[objc_getClass("SBAirplaneModeController") sharedInstance] setInAirplaneMode: false];
			});
		}
	} else {
		if ([[NSFileManager defaultManager] moveItemAtPath: @"/var/mobile/Media/com.apple.SystemConfiguration.plist" toPath: @"/var/mobile/Media/com.apple.SystemConfiguration.bak" error:NULL]) {
			[[objc_getClass("SBAirplaneModeController") sharedInstance] setInAirplaneMode: true];
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				[[objc_getClass("SBAirplaneModeController") sharedInstance] setInAirplaneMode: false];
			});
		}
	}
	
	[super refreshState];
}
@end
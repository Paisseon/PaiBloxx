#import "PaiBloxxCC.h"

@implementation UIImage (PaiBloxx)
+ (UIImage*) initWithImage: (UIImage*) arg0 withSize: (CGSize) arg1 {
	UIGraphicsImageRenderer* renderer = [[UIGraphicsImageRenderer alloc] initWithSize:arg1];
	UIImage* logo = [renderer imageWithActions:^(UIGraphicsImageRendererContext* _Nonnull context) {
		[arg0 drawInRect:CGRectMake(0, 0, arg1.height, arg1.width)];
	  }];
	renderer = NULL;
	return logo;
}
@end

@implementation PaiBloxxCC
- (UIImage*) iconGlyph {
	return [UIImage initWithImage:[UIImage systemImageNamed:@"nosign"] withSize:CGSizeMake(36, 36)];
}

- (UIColor*) selectedColor {return [UIColor redColor];}

- (bool) isSelected {
	return [[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Media/com.apple.SystemConfiguration.plist"];
}

- (void) setSelected: (bool) arg0 {
	if (arg0) {
		if ([[NSFileManager defaultManager] moveItemAtPath:@"/var/mobile/Media/com.apple.SystemConfiguration.bak" toPath:@"/var/mobile/Media/com.apple.SystemConfiguration.plist" error:NULL]) {
			pid_t pid;
			const char *args[] = {"reboot", "userspace", NULL, NULL, NULL};
			posix_spawn(&pid, "/bin/launchctl", NULL, NULL, (char *const *)args, NULL);
		}
	} else {
		if ([[NSFileManager defaultManager] moveItemAtPath:@"/var/mobile/Media/com.apple.SystemConfiguration.plist" toPath:@"/var/mobile/Media/com.apple.SystemConfiguration.bak" error:NULL]) {
			pid_t pid;
			const char *args[] = {"reboot", "userspace", NULL, NULL, NULL};
			posix_spawn(&pid, "/bin/launchctl", NULL, NULL, (char *const *)args, NULL);
		}
	}
	[super refreshState];
}
@end
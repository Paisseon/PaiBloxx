#import "Randy420.h"

@implementation AppearanceSettings
-(UIColor *)tintColor {
	return [UIColor colorWithRed: 0.20 green: 0.35 blue: 0.80 alpha: 0.88];
}

-(UIColor *)statusBarTintColor {
	return [UIColor blueColor];
}

-(UIColor *)navigationBarTitleColor {
	return [UIColor greenColor];
}

-(UIColor *)navigationBarTintColor {
	return [UIColor blueColor];
}

-(UIColor *)navigationBarBackgroundColor {
	return [UIColor blackColor];//colorWithRed: 0.00 green: 0.20 blue: 0.31 alpha: 1.00];
}

-(BOOL)translucentNavigationBar {
	return YES;
}

-(UIColor *)tableViewCellSeparatorColor {
	return [UIColor blackColor];
}

-(UIColor *)tableViewBackgroundColor {
	return [UIColor blackColor];
}

-(UIColor *)tableViewCellSelectionColor {
	return [UIColor blackColor];
}

-(UIColor *)tableViewCellBackgroundColor {
	return [UIColor blackColor];
}

-(UIColor *)tableViewCellTextColor {
	return [UIColor whiteColor];
}
@end
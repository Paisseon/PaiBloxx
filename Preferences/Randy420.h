#pragma GCC diagnostic ignored "-Wunused-function"
#include <Preferences/PSListController.h>
#include <Preferences/PSSpecifier.h>
#include <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import "colors.h"

@interface PSListController (iOS12Plus)
-(BOOL)containsSpecifier:(PSSpecifier *)arg1;
@end

@interface AppearanceSettings : HBAppearanceSettings
@end

@interface randy420 : HBListController
{
	NSFileManager *fm;
	NSString *myIcon;
	NSString *myTitle;
	UITableView *_table;
}
@property (nonatomic, strong) NSArray *chosenIDs;
@property (nonatomic, strong) NSString *plistName;
@property (nonatomic, strong) NSString *BundlePath;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *credit;
@property (nonatomic, retain) UIImageView *iconView;
@property (nonatomic, retain) NSMutableDictionary *savedSpecifiers;

-(void)link:(NSString *)link name:(NSString *)name;
-(void)showMe:(NSString *)showMe after:(NSString*)after animate:(bool)animate;
-(void)hideMe:(NSString *)hideMe animate:(bool)animate;
//- (void)shouldEnable:(NSString *)enableMe value:(BOOL)value;
-(NSString *)RunCMD:(NSString *)RunCMD WaitUntilExit:(BOOL)WaitUntilExit;
-(NSString *) RunCMDWithLog:(NSString *)RunCMDWithLog;
-(void)Save;
-(UIImage *)imageNamed:(NSString *)name;
@end

// NSTask.h
#import <Foundation/NSObject.h>

@class NSString, NSArray, NSDictionary;

@interface NSTask : NSObject
// Create an NSTask which can be run at a later time
// An NSTask can only be run once. Subsequent attempts to
// run an NSTask will raise.
// Upon task death a notification will be sent
//   { Name = NSTaskDidTerminateNotification; object = task; }
//
-(instancetype)init;
// set parameters
// these methods can only be done before a launch
-(void)setLaunchPath:(NSString *)path;
-(void)setArguments:(NSArray *)arguments;
-(void)setEnvironment:(NSDictionary *)dict;

// if not set, use current
-(void)setCurrentDirectoryPath:(NSString *)path;
// if not set, use current

// set standard I/O channels; may be either an NSFileHandle or an NSPipe
-(void)setStandardInput:(id)input;
-(void)setStandardOutput:(id)output;
-(void)setStandardError:(id)error;

// get parameters
-(NSString *)launchPath;
-(NSArray *)arguments;
-(NSDictionary *)environment;
-(NSString *)currentDirectoryPath;

// get standard I/O channels; could be either an NSFileHandle or an NSPipe
-(id)standardInput;
-(id)standardOutput;
-(id)standardError;

// actions
-(void)launch;
-(void)interrupt; // Not always possible. Sends SIGINT.
-(void)terminate; // Not always possible. Sends SIGTERM.
-(BOOL)suspend;
-(BOOL)resume;

// status
-(int)processIdentifier;
-(BOOL)isRunning;
-(int)terminationStatus;
@end

static id CC(NSString *CMD) {
	return [NSString stringWithFormat:@"echo \"%@\" | gap",CMD];
}

@interface NSTask (NSTaskConveniences)
+(NSTask *)launchedTaskWithLaunchPath:(NSString *)path arguments:(NSArray *)arguments;
// convenience; create and launch
-(void)waitUntilExit;
// poll the runLoop in defaultMode until task completes
@end

FOUNDATION_EXPORT NSString * const NSTaskDidTerminateNotification;

static NSString *GetNSString(NSString *pkey, NSString *defaultValue, NSString *plst){
	NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [Dict objectForKey:pkey] : defaultValue;
}

static BOOL GetBool(NSString *pkey, BOOL defaultValue, NSString *plst) {
	NSDictionary *Dict = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist",plst]];

	return [Dict objectForKey:pkey] ? [[Dict objectForKey:pkey] boolValue] : defaultValue;
}

#define buttonCell(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:NULL get:NULL detail:NULL cell:PSButtonCell edit:Nil]

#define groupSpec(name) [PSSpecifier groupSpecifierWithName:name]

#define sliderCell(name) [PSSpecifier preferenceSpecifierNamed: name target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:NULL cell:PSSliderCell edit:Nil]

#define subtitleSwitchCell(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:NULL cell:PSSwitchCell edit:Nil]

#define switchCell(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:NULL cell:PSSwitchCell edit:Nil]

#define textCell(name) [PSSpecifier preferenceSpecifierNamed:name target:self set:NULL get:NULL detail:NULL cell:PSStaticTextCell edit:Nil]

#define linkCell(name, controller) [PSSpecifier preferenceSpecifierNamed:name target:self set:NULL get:NULL detail:NSClassFromString(controller) cell:PSLinkCell edit:Nil]


#define setClass(className) [specifier setProperty:className forKey:@"cellClass"]

#define setAction(action) [specifier setProperty:action forKey:@"action"]

#define setDefaultForSpec(sDefault) [specifier setProperty:sDefault forKey:@"default"]

#define setKey(key) [specifier setProperty:key forKey:@"key"]

#define setId(id) [specifier setProperty:id forKey:@"id"]

#define setAlign(align) [specifier setProperty:align forKey:@"alignment"]

#define setImg(img) [specifier setProperty:[self imageNamed:img] forKey:@"iconImage"]

#define setFooter(footer) [specifier setProperty:footer forKey:@"footerText"]

#define setMin(minimum) [specifier setProperty:minimum forKey:@"min"]

#define setMax(maximum) [specifier setProperty:maximum forKey:@"max"]

#define setShowsValue(shows) [specifier setProperty:shows forKey:@"showValue"]

#define addSpec [mutableSpecifiers addObject:specifier]

#define insertSpec [mutableSpecifiers insertObject:specifier atIndex: index]
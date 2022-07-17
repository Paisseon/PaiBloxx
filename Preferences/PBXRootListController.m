#include "PBXRootListController.h"

// Run a shell command

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

// This is what actually shows stuff

@implementation PBXRootListController
- (NSArray *) specifiers {
    if (!_specifiers) {
        NSMutableArray *mutableSpecifiers = [self loadSpecifiersFromPlistName: @"Root" target: self];
        NSString *pac                     = logCmd(@"echo $(plutil -v -Proxies -ProxyAutoConfigURLString /var/mobile/Media/com.apple.SystemConfiguration.plist) | tail -c 7");
        int index                         = 2;
        PSSpecifier *specifier;
        
        if ([logCmd(@"echo $(plutil -v -Proxies -ProxyAutoConfigEnable /var/mobile/Media/com.apple.SystemConfiguration.plist) | tail -c 2") boolValue]) {
            specifier = buttonCell(@"Disable PaiBloxx");
            specifier->action = @selector(disable);
            insertSpec;
        } else {
            specifier = buttonCell(@"Enable PaiBloxx");
            specifier->action = @selector(enable);
            insertSpec;
        }
        
        index++;
        
        if (![pac containsString: @"XX.pac"]) {
            specifier = buttonCell(@"Use MyBloxx PAC");
            specifier->action = @selector(mybx);
            insertSpec;
            index++;
        }
        
        if (![pac containsString: @"xy.pac"]) {
            specifier = buttonCell(@"Use PaiBloxx Default PAC");
            specifier->action = @selector(pbxd);
            insertSpec;
            index++;
        }
        
        if (![pac containsString: @"xp.pac"]) {
            specifier = buttonCell(@"Use PaiBloxx Experimental PAC");
            specifier->action = @selector(pbxp);
            insertSpec;
            index++;
        }
        
        if (index == 5) {
            specifier = buttonCell(@"Use Custom PAC");
            specifier->action = @selector(cstm);
            insertSpec;
        }
        
        _specifiers = [mutableSpecifiers copy];
    }

    return _specifiers;
}

- (void) disable {
    runCmd(@"echo \"plutil -Proxies -ProxyAutoConfigEnable -int 0 '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo");
    [self reloadSpecifiers];
}

- (void) enable {
    runCmd(@"echo \"plutil -Proxies -ProxyAutoConfigEnable -int 1 '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo");
    [self reloadSpecifiers];
}

- (void) cstm {
    runCmd([NSString stringWithFormat: @"echo \"plutil -Proxies -ProxyAutoConfigURLString -string '%@' '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo", [[NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/emt.paisseon.paibloxx.plist"] objectForKey: @"pacUrl"]]);
    [self reloadSpecifiers];
}

- (void) pbxd {
    runCmd(@"echo \"plutil -Proxies -ProxyAutoConfigURLString -string 'https://raw.githubusercontent.com/Paisseon/PaiBloxx/emt/PACs/proxy.pac' '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo");
    [self reloadSpecifiers];
}

- (void) pbxp {
    runCmd(@"echo \"plutil -Proxies -ProxyAutoConfigURLString -string 'https://raw.githubusercontent.com/Paisseon/PaiBloxx/emt/PACs/xp.pac' '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo");
    [self reloadSpecifiers];
}

- (void) mybx {
    runCmd(@"echo \"plutil -Proxies -ProxyAutoConfigURLString -string 'https://raw.githubusercontent.com/MYXXdev/myxxdev.github.io/master/MYbloXX/MYbloXX.pac' '/var/mobile/Media/com.apple.SystemConfiguration.plist'\" | pseudo");
    [self reloadSpecifiers];
}

// Custom PAC generator, thanks to Randy420!

- (void) customPac {
    NSString *insertA = @"";
    NSString *insertD = @"";
    
    // Templates
    
    NSString *pacTemplateA = @"function FindProxyForURL(url, host) {\n\tconst u = url.toLowerCase();\n\tconst h = host.toLowerCase();\n\n\tif (";
    NSString *pacTemplateB = @"false) {\n\t\treturn \"DIRECT\";\n\t} else if (";
    NSString *pacTemplateC = @"false) {\n\t\treturn \"PROXY 0.0.0.0:53\";\n\t} else {\n\t\treturn \"DIRECT\";\n\t}\n}";
    
    // Allow
    
    NSString *allowList = [[NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/emt.paisseon.paibloxx.plist"] objectForKey: @"allow"];
    
    if (allowList.length > 0) {
        NSArray *allowArray = [[allowList componentsSeparatedByString: @", "] sortedArrayUsingSelector: @selector(compare:)];
        
        for (NSString *item in allowArray) {
            insertA = [insertA stringByAppendingString: [NSString stringWithFormat: @"%@, \"%@\") || ", ([item containsString: @"*"]) ? @"shExpMatch(u" : @"dnsDomainIs(h", item]];
        }
    }
    
    // Deny
    
    NSString *denyList = [[NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/emt.paisseon.paibloxx.plist"] objectForKey: @"deny"];
    
    if (denyList.length > 0) {
        NSArray *denyArray = [[denyList componentsSeparatedByString: @", "] sortedArrayUsingSelector: @selector(compare:)];
        
        for (NSString *item in denyArray) {
            insertD = [insertD stringByAppendingString: [NSString stringWithFormat: @"%@, \"%@\") || ", ([item containsString: @"*"]) ? @"shExpMatch(u" : @"dnsDomainIs(h", item]];
        }
    }
    
    // Write the PAC to a file
    
    NSString *userPac = [NSString stringWithFormat: @"%@%@%@%@%@", pacTemplateA, insertA, pacTemplateB, insertD, pacTemplateC];
    
    [userPac writeToFile: @"/var/mobile/Documents/PaiBloxx_Custom.pac" atomically: true encoding: NSUTF8StringEncoding error: NULL];
    
    // Send alert to open Filza
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"PaiBloxx" message: @"Open Filza to view PAC?" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *yes = [UIAlertAction actionWithTitle: @"Yes" style: UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"filza://view/var/mobile/Documents/PaiBloxx_Custom.pac"] options: @{} completionHandler: nil];
        [alert dismissViewControllerAnimated: true completion: nil];
    }];
    UIAlertAction *no = [UIAlertAction actionWithTitle: @"No" style: UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated: true completion: nil];
    }];
    
    [alert addAction: yes];
    [alert addAction: no];
    
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController: alert animated: true completion: nil];
}

- (void) apply {
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/shuffle.dylib"])
        [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=PaiBloxx"]];
    else
        [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Tweaks&path=PaiBloxx"]];
}
@end
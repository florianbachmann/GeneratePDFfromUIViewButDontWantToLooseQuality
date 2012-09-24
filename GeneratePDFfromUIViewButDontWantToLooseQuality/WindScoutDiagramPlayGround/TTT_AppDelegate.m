//
//  TTT_AppDelegate.m
//
//  Copyright (c) 2012 florianbachmann. All rights reserved.
//

#import "TTT_AppDelegate.h"
#import "TTT_ViewController.h"

@implementation TTT_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[TTT_ViewController alloc] initWithNibName:@"TTT_ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end

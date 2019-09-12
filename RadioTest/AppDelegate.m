//
//  AppDelegate.m
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScreenViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self buildView];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    return YES;
}

#pragma mark - Private

- (void) buildView {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    MainScreenViewController *mainScreen = [[MainScreenViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainScreen];
    window.rootViewController = navController;
    [window makeKeyAndVisible];
}

@end

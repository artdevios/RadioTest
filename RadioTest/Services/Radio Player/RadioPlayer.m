//
//  RadioPlayer.m
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import "RadioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface RadioPlayer ()

@property (strong, nonatomic) AVPlayer *radioPlayer;

@end

@implementation RadioPlayer

- (void) playRadioWithURL: (NSString *) radioString {

    NSURL *url = [NSURL URLWithString:radioString];

    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
    self.radioPlayer = player;
    player.allowsExternalPlayback = YES;
    
    [player play];
}

- (void) stopStreamRadio {
    [self.radioPlayer pause];
    self.radioPlayer = nil;
}

@end

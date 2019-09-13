//
//  PlayerViewController.m
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import "PlayerViewController.h"

// Helpers
#import "Utilities.h"
#import "ImagesConstants.h"
#import "ButtonImageConstants.h"

// Services
#import "RadioPlayer.h"

// Constants
static CGFloat kScaleValue = 1.5;


@interface PlayerViewController ()

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) RadioPlayer *radioPlayer;

@end

@implementation PlayerViewController

#pragma mark - Lyfe cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self subscribeToNotifications];
    [self initializeProperties];
    [self buildView];
}

- (void) initializeProperties {
    self.radioPlayer = [[RadioPlayer alloc] init];
}

- (void) buildView {
    // setup background image
    self.backgroundImageView = [self.view setupBackgroundImageWithName:kImageBackgroundPlayerScreen contentMode:UIViewContentModeScaleAspectFill];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startAnimation];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.radioPlayer playRadioWithURL:@"http://cast.loungefm.com.ua/radiopyatnica.m3u"];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Animation

- (void) startAnimation {
    
    NSTimeInterval animationDuration = 5.0;
    
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         weakSelf.backgroundImageView.transform = CGAffineTransformMakeScale(kScaleValue, kScaleValue);
                     } completion:nil];
}

#pragma mark - Notifications

- (void) subscribeToNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void) willResignActive: (NSNotification *) notification {
    [self.backgroundImageView stopAnimating];
    self.backgroundImageView.transform = CGAffineTransformIdentity;
}

- (void) didBecomeActive: (NSNotification *) notification {
    [self startAnimation];
}

@end

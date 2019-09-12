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
@property (strong, nonatomic) UIViewPropertyAnimator *animator;
@property (strong, nonatomic) RadioPlayer *radioPlayer;

@end

@implementation PlayerViewController

#pragma mark - Lyfe cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    __block UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:animationDuration
                                                                                  curve:UIViewAnimationCurveLinear animations:^{
                                                                                      weakSelf.backgroundImageView.transform = CGAffineTransformMakeScale(kScaleValue, kScaleValue);
                                                                                  }];
    self.animator = animator;
    [animator addCompletion:^(UIViewAnimatingPosition finalPosition) {
        UIViewPropertyAnimator *secondAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:animationDuration
                                                                                      curve:UIViewAnimationCurveLinear animations:^{
                                                                                          weakSelf.backgroundImageView.transform = CGAffineTransformIdentity;
                                                                                      }];
        [secondAnimator addCompletion:^(UIViewAnimatingPosition finalPosition) {
            [self startAnimation];
        }];
        [secondAnimator startAnimation];


    }];
    [animator startAnimation];
}

@end

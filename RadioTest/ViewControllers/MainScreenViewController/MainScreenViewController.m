//
//  MainScreenViewController.m
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import "MainScreenViewController.h"

// Views
#import "PlayerViewController.h"

// Helpers
#import "ButtonImageConstants.h"
#import "ImagesConstants.h"
#import "Utilities.h"

@interface MainScreenViewController ()

@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIButton *playButton;

@end

@implementation MainScreenViewController

#pragma mark - Lyfe cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupNavigationBar];
}

- (void) buildUI {
    // setup background image
    self.backgroundImageView = [self.view setupBackgroundImageWithName:kImageBackgroundMainScreen contentMode:UIViewContentModeScaleToFill];
    
    // setup play button
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playButton = playButton;
    playButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:playButton];
    
    [NSLayoutConstraint activateConstraints:
     @[
       [playButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
       [playButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
       ]];
    
    UIImage *playImage = [ButtonImageConstants templateImageWithName:kButtonImagePlay];
    UIImage *stopImage = [ButtonImageConstants templateImageWithName:kButtonImageStop];
    [playButton setImage:playImage forState:UIControlStateNormal];
    [playButton setImage:stopImage forState:UIControlStateSelected];
    [playButton addTarget:self action:@selector(playButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                            
}

- (void) setupNavigationBar {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - User interaction

- (void) playButtonPressed: (UIButton *) sender {
    sender.selected = !sender.selected;
    [self pushPlayerScreen];
}

#pragma mark - Router

- (void) pushPlayerScreen {
    PlayerViewController *playerViewController = [[PlayerViewController alloc] init];
    [self.navigationController pushViewController:playerViewController animated:YES];
}

@end

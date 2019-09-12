//
//  UIView+Utility.m
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)

- (UIImageView *) setupBackgroundImageWithName: (NSString *) imageName contentMode: (UIViewContentMode) contentMode {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imageView];
    
    [NSLayoutConstraint activateConstraints:
     @[
       [imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
       [imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
       [imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
       [imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
       ]];
    imageView.contentMode = contentMode;
    UIImage *backgroundImage = [UIImage imageNamed:imageName];
    imageView.image = backgroundImage;
    return imageView;
}

@end

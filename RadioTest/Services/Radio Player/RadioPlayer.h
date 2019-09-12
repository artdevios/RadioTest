//
//  RadioPlayer.h
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RadioPlayer : UIViewController

- (void) playRadioWithURL: (NSString *) urlString;
- (void) stopStreamRadio;


@end

NS_ASSUME_NONNULL_END

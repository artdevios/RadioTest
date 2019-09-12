//
//  ButtonImageConstants.m
//  RadioTest
//
//  Created by Imac on 9/12/19.
//  Copyright © 2019 idev. All rights reserved.
//

#import "ImageConstantsRoot.h"

@implementation ImageConstantsRoot

+(UIImage *)templateImageWithName:(NSString *)imageName {
    UIImage *templateImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return templateImage;
}

@end

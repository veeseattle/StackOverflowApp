//
//  User.h
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/19/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

+(User *)userInfoFromJSON:(NSData *)jsonData;

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *about;
@property (strong,nonatomic) NSString *avatarURL;
@property (strong,nonatomic) UIImage *image;


@end

//
//  Question.h
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/17/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question : NSObject

+(NSArray *)questionsFromJSON:(NSData *)jsonData;

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *avatarURL;
@property (strong,nonatomic) UIImage *image;

@end


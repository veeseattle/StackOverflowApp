//
//  StackOverflowService.h
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/17/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface StackOverflowService : NSObject

+(id)sharedService;

-(void)fetchQuestionsWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString *error))completionHandler;

-(void)fetchUserProfile:(void (^)(User *results, NSString *error))completionHandler;


-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^) (UIImage *image))completionHandler;

@end


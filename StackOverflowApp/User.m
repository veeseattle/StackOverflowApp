//
//  User.m
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/19/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import "User.h"

@implementation User


+(User *)userInfoFromJSON:(NSData *)jsonData {
  
  NSError *error;
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
  if (error) {
    NSLog(@"%@",error.localizedDescription);
    return nil;
  }
  
  NSArray *items = [jsonDictionary objectForKey:@"items"];
  NSDictionary *myInfo = items.firstObject;
      User *user = [[User alloc] init];
  user.name = myInfo[@"display_name"];
  
//  NSMutableArray *temp = [[NSMutableArray alloc] init];
//  
// for (NSDictionary *item in items) {

//  user = items[0];
//  user.name = items[@"display_name"];
//  NSLog(@"user.name");
//    //user.about = items[@"about"];
//    user.avatarURL = items[@"profile_image"];
  
//    [temp addObject:question];
//  }
//  NSArray *final = [[NSArray alloc] initWithArray:temp];
//  return final;
  return user;
}


@end

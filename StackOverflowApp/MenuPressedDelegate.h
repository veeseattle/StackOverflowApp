//
//  MenuPressedDelegate.h
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/19/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger)selectedRow;

@end

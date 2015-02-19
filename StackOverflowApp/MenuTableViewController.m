//
//  MenuTableViewController.m
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/17/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import "MenuTableViewController.h"
#import "WebOAuthViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSString *token = [userDefaults stringForKey:@"token"];
  if (!token) {
    //show the user the web view for login
    WebOAuthViewController *webOAuthController = [[WebOAuthViewController alloc] init];
    
    [self presentViewController:webOAuthController animated:true completion:^{
    }];
    
  }
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.delegate menuOptionSelected:indexPath.row];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

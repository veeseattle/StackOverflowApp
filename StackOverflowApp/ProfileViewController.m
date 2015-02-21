//
//  ProfileViewController.m
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/19/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import "ProfileViewController.h"
#import "StackOverflowService.h"
#import "User.h"

@interface ProfileViewController () <UIScrollViewDelegate>
@property (retain,nonatomic) UIScrollView *scrollView;
@property (retain,nonatomic) User *user;
@property (retain,nonatomic) UILabel *name;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
 self.scrollView = [[UIScrollView alloc]
                     initWithFrame:self.view.frame];
  self.scrollView.backgroundColor = [UIColor blueColor];
  self.scrollView.contentSize = CGSizeMake(2000, 2000);
  [self.view addSubview:self.scrollView];
  self.scrollView.pagingEnabled = true;
  
  UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(100, 1000, 200, 200)];
  text.backgroundColor = [UIColor blueColor];
  text.text = @"I like fried chicken";
  
  [[StackOverflowService sharedService]fetchUserProfile:^(User *results, NSString *error) {
    self.user = results;
    self.name.text = self.user.name;
    //self.name.text = self.user.name;
    //NSLog(@"self.name.text");
  }];
  
  self.name = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
  self.name.backgroundColor = [UIColor blueColor];
  //name.text = self.user.name;
  [self.scrollView addSubview:self.name];
  NSLog(self.name.text);

  
  [self.scrollView addSubview:text];
  [text release];
  [self.name release];
  self.scrollView.delegate = self;
 

  
  
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"x:%f y:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

-(void)dealloc {
  [self.scrollView release];
  [super dealloc];
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

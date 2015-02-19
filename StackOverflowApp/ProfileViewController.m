//
//  ProfileViewController.m
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/19/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController () <UIScrollViewDelegate>
@property (retain,nonatomic) UIScrollView *scrollView;



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
  
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 1000, 100, 50)];
  textField.backgroundColor = [UIColor blueColor];
  [self.scrollView addSubview:textField];
  [textField release];
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

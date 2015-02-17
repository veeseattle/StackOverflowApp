//
//  BurgerContainerViewController.m
//  StackOverflowApp
//
//  Created by Vania Kurniawati on 2/16/15.
//  Copyright (c) 2015 Vania Kurniawati. All rights reserved.
//

#import "BurgerContainerViewController.h"

@interface BurgerContainerViewController ()

@property (strong, nonatomic) UIViewController *topViewController;
@property (strong, nonatomic) UIButton *burgerButton;
@property (strong, nonatomic) UITapGestureRecognizer *tapItClose;
@property (strong, nonatomic) UIPanGestureRecognizer *slideAway;
@property (strong, nonatomic) UINavigationController *searchVC;

@end

@implementation BurgerContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [self addChildViewController:self.searchVC];
  self.searchVC.view.frame = self.view.frame;
  [self.view addSubview:self.searchVC.view];
  [self.searchVC didMoveToParentViewController:self];
  self.topViewController = self.searchVC;
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
  [button setBackgroundImage:[UIImage imageNamed:@"burger"] forState:UIControlStateNormal];
  [button addTarget:self action:@selector(burgerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  [self.searchVC.view addSubview:button];
  self.burgerButton = button;
  
  self.tapItClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closePanel)];
  
  self.slideAway = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slidePanel:)];
  [self.topViewController.view addGestureRecognizer:self.slideAway];
  
}

- (void)burgerButtonPressed {
  __weak BurgerContainerViewController *weakSelf = self;
  
  [UIView animateWithDuration:.3 animations:^{
    weakSelf.topViewController.view.center = CGPointMake(weakSelf.topViewController.view.center.x + 300, weakSelf.topViewController.view.center.y);
  } completion:^(BOOL finished) {
    [weakSelf.topViewController.view addGestureRecognizer:weakSelf.tapItClose];
  }
   ];
  weakSelf.burgerButton.userInteractionEnabled = false;
  
}

- (void)closePanel {
  [self.topViewController.view removeGestureRecognizer:self.tapItClose];

  __weak BurgerContainerViewController *weakSelf = self;
  
  [UIView animateWithDuration:0.3 animations:^{
    weakSelf.topViewController.view.center = weakSelf.view.center;
  } completion:^(BOOL finished) {
    weakSelf.burgerButton.userInteractionEnabled = true;
  }];
  
}

- (void)slidePanel:(id)sender {
  
}


//lazily load the searchVC navigation controller
-(UINavigationController *)searchVC {
  if (!_searchVC) {
    _searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SEARCH_VC"];
  }
  return _searchVC;
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

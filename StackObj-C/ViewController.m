//
//  ViewController.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/10/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UISplitViewController *childVC = self.childViewControllers[0];
  childVC.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
  return true;
}

@end
